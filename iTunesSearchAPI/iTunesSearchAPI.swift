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
  
  public func searchFor(term: String, ofType type: Media = .All(nil), options: Options? = nil, completion: SearchCompletionHandler) {
    
    guard let URLEscapedTerm = term.URLEscaped else { completion(nil, .InvalidSearchTerm); return }
    
    let typeParameter = type.parameters
    let termParameter = ["term" : URLEscapedTerm]
    let parameters    = typeParameter.union(termParameter)
    
    guard let URL = URLWithParameters(parameters) else { completion(nil, .InvalidURL); return }
    
    // print request
    print("Request url: \(URL)")
    
    // create data task
    let task = searchTaskWith(URL, completion: completion)
    
    // start task
    task.resume()
    
  }
  
  // MARK: - Helper
  
  private func searchTaskWith(URL: NSURL, completion: SearchCompletionHandler) -> NSURLSessionDataTask {
    return NSURLSession.sharedSession().dataTaskWithURL(URL) { data, response, error in
      
      guard let httpResponse = response as? NSHTTPURLResponse else {
        mainQueue { completion(nil, .ServerError(0)) }
        return
      }
      
      
      guard 200...299 ~= httpResponse.statusCode else {
        mainQueue { completion(nil, .ServerError(httpResponse.statusCode)) }
        return
      }
      
      guard let
        data = data,
        json = try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? [String : AnyObject] else {
          mainQueue { completion(nil, .InvalidJSON) }
          return
      }
      
      mainQueue { completion(json, nil) }
    }
  }
  
  private func URLWithParameters(parameters: [String : String]) -> NSURL? {
    let components  = NSURLComponents()
    components.scheme = "https"
    components.host   = base
    components.path   = "/search"
    return components.URL
  }
}

