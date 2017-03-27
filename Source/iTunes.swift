//
//  iTunesSearchAPI.swift
//  iTunesSearchAPI
//
//  Created by Sven Bacia on 27.02.16.
//  Copyright © 2016 Sven Bacia. All rights reserved.
//

import Foundation

public final class iTunes {
  
  // MARK: - Properties
  
  public var isDebug = false
  
  private let base = "itunes.apple.com"
  
  // MARK: - Init
  
  public init(debug: Bool = false) {
    self.isDebug = debug
  }
  
  // MARK: - Search Function
  
  public func search(for query: String, ofType type: Media = .all(nil), options: Options? = nil, completion: @escaping (Result<Any, SearchError>) -> Void) -> URLSessionTask? {
    
    // build parameter dictionary
    let params = parameters(forQuery: query, media: type, options: options)
    
    guard let url = url(withParameters: params) else {
      completion(.failure(.invalidURL))
      return nil
    }
    
    // print request for debug purposes
    if isDebug {
      print("Request url: \(url)")
    }
    
    // create data task
    let task = searchTask(withURL: url, completion: completion)
    
    // start task
    task.resume()
    
    return task
  }
  
  public func lookup(media upc: String, options: Options? = nil, completion: @escaping (Result<Any, SearchError>) -> Void) -> URLSessionTask? {
    let params = parameters(forID: upc, tag: "upc", options: options)
    return self.lookupWithParams(params: params, completion: completion)
  }
  
  public func lookup(book isbn: String, options: Options? = nil, completion: @escaping (Result<Any, SearchError>) -> Void) -> URLSessionTask? {
    let params = parameters(forID: isbn, tag: "isbn", options: options)
    return self.lookupWithParams(params: params, completion: completion)
  }
  
  public func lookup(for id: String, options: Options? = nil, completion: @escaping (Result<Any, SearchError>) -> Void) -> URLSessionTask? {
    let params = parameters(forID: id, tag: "id", options: options)
    return self.lookupWithParams(params: params, completion: completion)
  }
  
  func lookupWithParams(params: [String: String],  completion: @escaping (Result<Any, SearchError>) -> Void) -> URLSessionTask? {
    guard let url = url(withParameters: params, path: "/lookup") else {
      completion(.failure(.invalidURL))
      return nil
    }
    
    // print request for debug purposes
    if isDebug {
      print("Request url: \(url)")
    }
    
    // create data task
    let task = searchTask(withURL: url, completion: completion)
    
    // start task
    task.resume()
    
    return task
  }
  
  // MARK: - Helper
  
  private func searchTask(withURL url: URL, completion: @escaping (Result<Any, SearchError>) -> Void) -> URLSessionDataTask {
    return URLSession.shared.dataTask(with: url) { data, response, error in
      
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
  
  private func parameters(forQuery query: String, media: Media? = nil, options: Options? = nil) -> [String: String] {
    var parameters = [ "term" : query ]
    
    if let media = media {
      parameters.unionInPlace(media.parameters)
    }
    
    if let options = options?.parameters {
      parameters.unionInPlace(options)
    }
    
    return parameters
  }
  
  private func parameters(forID id: String, tag: String, options: Options? = nil) -> [String: String] {
    var parameters = [ tag : id ]
    if let options = options?.parameters {
      parameters.unionInPlace(options)
    }
    return parameters
  }
  
  private func url(withParameters parameters: [String: String], path: String = "/search") -> URL? {
    var components = URLComponents()
    components.scheme = "https"
    components.host = base
    components.path = path
    components.queryItems = parameters.map { URLQueryItem(name: $0.0, value: $0.1) }
    return components.url
  }
}
