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
  
  public static let defaultSearch = iTunesSearchAPI()
  
  // MAKR: - Properties
  
  private let base = "itunes.apple.com"
  
  // MARK: - Search Function
  
  public func searchFor(media: Media, options: Options? = nil, completion: (JSON?, Error?) -> Void) {
    
    // query items for current search
    let queryItems = media.queryItems

    // build url
    guard let url = URLWithQueryItems(queryItems) else {
      completion(nil, .InvalidURL)
      return
    }
    
    // print request
    print("Request url: \(url)")
    
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
}

