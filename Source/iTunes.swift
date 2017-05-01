//
//  iTunesSearchAPI.swift
//  iTunesSearchAPI
//
//  Created by Sven Bacia on 27.02.16.
//  Copyright © 2016 Sven Bacia. All rights reserved.
//

import Foundation

public typealias NetworkResponse = Result<Any, SearchError>

public final class iTunes {
    
    // MARK: - Properties
    
    public var isDebug = false
    
    private let base = "itunes.apple.com"
    private let session: URLSession
    
    // MARK: - Init
    
    public init(session: URLSession = URLSession.shared, debug: Bool = false) {
        self.session = session
        self.isDebug = debug
    }
    
    // MARK: - Search Function
    
    public func search(for query: String, ofType type: Media = .all(nil), options: Options? = nil, completion: @escaping (NetworkResponse) -> Void) -> URLSessionTask? {
        
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
    
    public func lookup(by type: LookupType, options: Options? = nil, completion: @escaping (NetworkResponse) -> Void) -> URLSessionTask? {
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
    
    private func buildTask(withURL url: URL, completion: @escaping (NetworkResponse) -> Void) -> URLSessionDataTask {
        return session.dataTask(with: url) { data, response, error in
            
            guard let httpResponse = response as? HTTPURLResponse else {
                DispatchQueue.main.async { completion(.failure(.invalidServerResponse)) }
                return
            }
            
            guard 200...299 ~= httpResponse.statusCode else {
                DispatchQueue.main.async { completion(.failure(.serverError(httpResponse.statusCode))) }
                return
            }
            
            guard let data = data,
                let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as AnyObject else {
                    DispatchQueue.main.async { completion(.failure(.invalidJSON)) }
                    return
            }
            
            DispatchQueue.main.async { completion(.success(json)) }
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
