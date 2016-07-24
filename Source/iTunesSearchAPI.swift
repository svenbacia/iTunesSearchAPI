//
//  iTunesSearchAPI.swift
//  iTunesSearchAPI
//
//  Created by Sven Bacia on 27.02.16.
//  Copyright © 2016 Sven Bacia. All rights reserved.
//

import Foundation

public typealias SearchCompletionHandler = ([String : AnyObject]?, Error?) -> Void

public final class iTunesSearchAPI {
  
  // MARK: - Singleton Instance
  
  public static let defaultSearch = iTunesSearchAPI()
  
  // MAKR: - Properties
  
  private let base = "itunes.apple.com"
  
  // MARK: - Search Function
  
  public func searchFor(_ term: String, ofType type: Media = .all(nil), options: Options? = nil, completion: SearchCompletionHandler) {
    
    // escape search string
    guard let URLEscapedTerm = term.urlEscaped else { completion(nil, .invalidSearchTerm); return }
    
    // build parameter dictionary
    let typeParameter = type.parameters
    let termParameter = ["term" : URLEscapedTerm]
    let parameters    = typeParameter.union(termParameter)
    
    guard let URL = URLWithParameters(parameters) else { completion(nil, .invalidURL); return }
    
    // print request for debug purposes
    print("Request url: \(URL)")
    
    // create data task
    let task = searchTaskWith(URL, completion: completion)
    
    // start task
    task.resume()
  }
  
  // MARK: - Helper
  
  private func searchTaskWith(_ URL: Foundation.URL, completion: SearchCompletionHandler) -> URLSessionDataTask {
    return URLSession.shared.dataTask(with: URL) { data, response, error in
      
      guard let httpResponse = response as? HTTPURLResponse else {
        DispatchQueue.main.async { completion(nil, .serverError(0)) }
        return
      }
      
      guard 200...299 ~= httpResponse.statusCode else {
        DispatchQueue.main.async { completion(nil, .serverError(httpResponse.statusCode)) }
        return
      }
      
      guard let data = data,
            let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String : AnyObject] else {
              DispatchQueue.main.async { completion(nil, .invalidJSON) }
          return
      }
      
      DispatchQueue.main.async { completion(json, nil) }
    }
  }
  
  private func URLWithParameters(_ parameters: [String : String]) -> URL? {
    var components  = URLComponents()
    components.scheme = "https"
    components.host   = base
    components.path   = "/search"
    components.queryItems = parameters.map { URLQueryItem(name: $0.0, value: $0.1) }
    return components.url
  }
}

