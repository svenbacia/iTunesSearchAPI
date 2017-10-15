//
//  iTunesSearchAPI.swift
//  iTunesSearchAPI
//
//  Created by Sven Bacia on 27.02.16.
//  Copyright © 2016 Sven Bacia. All rights reserved.
//

import Foundation

public final class iTunes {
    
    /// Each network request returns a Result which contains either a decoded json or an `iTunes.Error`.
    public typealias ResponseHandler = (iTunes.Result<Any, iTunes.Error>) -> Void
    
    // MARK: - Properties
    
    /// Indicates whether debug mode is enabled or not.
    public var isDebug = false
    
    private let base = "itunes.apple.com"
    private let session: URLSession
    
    // MARK: - Init
    
    
    /// Creates an iTunes Search API client with a specific `URLSession`.
    ///
    /// - Parameters:
    ///   - session: A session which is used for downloading content. The default value is `URLSession.shared`.
    ///   - debug: Indicates if debug mode is enabled or not. In debug mode there will be an additional console output about the requested urls.
    public init(session: URLSession = URLSession.shared, debug: Bool = false) {
        self.session = session
        self.isDebug = debug
    }
    
    // MARK: - Search Function
    
    
    /// Creates a search request for a specific `query`.
    ///
    /// - Parameters:
    ///   - query: The search query.
    ///   - type: The media type of the search. The default value is `.all`.
    ///   - options: Additional options like language, country or limit.
    ///   - completion: The completion handler which return the result of the API request.
    /// - Returns: The new session data task.
    public func search(for query: String, ofType type: Media = .all(nil), options: Options? = nil, completion: @escaping ResponseHandler) -> URLSessionTask? {
        
        // build parameter dictionary
        let params = parameters(forQuery: query, media: type, options: options)
        
        guard let url = url(withPath: "/search", parameters: params) else {
            completion(.failure(.invalidURL))
            return nil
        }
        
        // print request for debug purposes
        if isDebug {
            print("Request url: \(url)")
        }
        
        // create data task
        let task = buildTask(withURL: url, completion: completion)
        
        // start task
        task.resume()
        
        return task
    }
    
    // MARK: - Lookup
    
    
    /// Creates a lookup request for a specific `LookupType`.
    ///
    /// - Parameters:
    ///   - type: The lookup type for example `id` or `isbn`.
    ///   - options: Additional options like language, country or limit.
    ///   - completion: The completion handler which return the result of the API request.
    /// - Returns: The new session data task.
    public func lookup(by type: LookupType, options: Options? = nil, completion: @escaping ResponseHandler) -> URLSessionTask? {
        let params = parameters(forLookup: type, options: options)
        
        guard let url = url(withPath: "/lookup", parameters: params) else {
            completion(.failure(.invalidURL))
            return nil
        }
        
        // create data task
        let task = buildTask(withURL: url, completion: completion)
        
        // start task
        task.resume()
        
        return task
    }
    
    // MARK: - Helper
    
    private func buildTask(withURL url: URL, completion: @escaping ResponseHandler) -> URLSessionDataTask {
        return session.dataTask(with: url) { data, response, error in
            
            guard let httpResponse = response as? HTTPURLResponse else {
                DispatchQueue.main.async {
                    completion(.failure(.invalidServerResponse))
                }
                return
            }
            
            // check for successful status code
            guard 200...299 ~= httpResponse.statusCode else {
                DispatchQueue.main.async {
                    completion(.failure(.serverError(httpResponse.statusCode)))
                }
                return
            }
            
            // try to decode the response json
            guard let data = data, let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) else {
                DispatchQueue.main.async {
                    completion(.failure(.invalidJSON))
                }
                return
            }
            
            DispatchQueue.main.async {
                completion(.success(json))
            }
        }
    }
    
    // MARK: - Parameters
    
    private func parameters(forQuery query: String, media: Media? = nil, options: Options? = nil) -> [String: String] {
        var parameters = ["term": query]
        
        if let media = media {
            parameters.unionInPlace(media.parameters)
        }
        
        if let options = options?.parameters {
            parameters.unionInPlace(options)
        }
        
        return parameters
    }
    
    private func parameters(forLookup lookup: LookupType, options: Options? = nil) -> [String: String] {
        var parameters = lookup.parameters
        if let options = options?.parameters {
            parameters.unionInPlace(options)
        }
        return parameters
    }
    
    // MARK: - URL
    
    private func url(withPath path: String, parameters: [String: String]) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = base
        components.path = path
        components.queryItems = parameters.map { URLQueryItem(name: $0.0, value: $0.1) }
        return components.url
    }
}
