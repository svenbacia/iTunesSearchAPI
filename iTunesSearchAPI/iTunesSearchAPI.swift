//
//  iTunesSearchAPI.swift
//  iTunesSearchAPI
//
//  Created by Sven Bacia on 27.02.16.
//  Copyright © 2016 Sven Bacia. All rights reserved.
//

import Foundation

public typealias JSON = [String : AnyObject]

public final class iTunesSearchAPI {
  
  // MARK: - Singleton Instance
  
  public static let defaultInstance = iTunesSearchAPI()
  
  // MAKR: - Properties
  
  private let base = "itunes.apple.com"
  
  // MARK: - Search Function
  
  public func searchFor(search: String, mediaType: Media? = nil, completion: (JSON?, Error?) -> Void) {
    
    // encode search term
    guard let escapedString = URLEscapedString(search) else {
      completion(nil, .InvalidSearchTerm)
      return
    }
    
    let term = NSURLQueryItem(name: "term", value: escapedString)
    
    // build url
    guard let url = URLWithQueryItems([term]) else {
      completion(nil, .InvalidURL)
      return
    }
    
    // create data task
    let task = NSURLSession.sharedSession().dataTaskWithURL(url) { data, response, error in
      
      guard let httpResponse = response as? NSHTTPURLResponse else { return }
      guard 200...299 ~= httpResponse.statusCode else {
        mainQueue { completion(nil, .ServerError(httpResponse.statusCode)) }
        return
      }
      
      guard let data = data else { return }
      guard let json = try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? JSON else {
        mainQueue { completion(nil, .InvalidJSON) }
        return
      }
      
      mainQueue { completion(json, nil) }
    }
    
    // start task
    task.resume()
  }
  
  // MARK: - Helper
  
  private func URLWithQueryItems(items: [NSURLQueryItem]) -> NSURL? {
    let components  = NSURLComponents()
    components.scheme = "https"
    components.host   = base
    components.path   = "/search"
    components.queryItems = items
    return components.URL
  }
  
  private func URLEscapedString(string: String) -> String? {
    return string.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet())
  }
}

