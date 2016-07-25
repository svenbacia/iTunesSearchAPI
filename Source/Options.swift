//
//  Options.swift
//  iTunesSearchAPI
//
//  Created by Sven Bacia on 27.02.16.
//  Copyright © 2016 Sven Bacia. All rights reserved.
//

import Foundation

public struct Options {
  
  /// The country for the store you want to search. The search uses the default store front for the specified country.
  /// The default is US.
  public let country: Country?
  
  /// The number of search results you want the iTunes Store to return. The default is 50. The minimum is 1, the maximum 200.
  public let limit: Int?
  
  /// The language, English or Japanese, you want to use when returning search results. The default is en_us (English).
  public let language: Language?
  
  /// A flag indicating whether or not you want to include explicit content in your search results. The default is Yes.
  public let includeExplicitContent: Bool?
  
  // MARK: - Init
  
  public init(country: Country? = nil, limit: Int? = nil, language: Language? = nil, includeExplicitContent: Bool? = nil) {
    self.country  = country
    self.limit    = limit
    self.language = language
    self.includeExplicitContent = includeExplicitContent
  }
}

extension Options {
  var parameters: [String : String]? {
    var param = [String : String]()
    
    if let country = country {
      param["country"] = country.code
    }
    
    if let limit = limit {
      param["limit"] = String(limit)
    }
    
    if let language = language {
      param["lang"] = language.rawValue
    }
    
    if let explicit = includeExplicitContent {
      param["explicit"] = explicit ? "Yes" : "No"
    }
    
    return param.count > 0 ? param : nil
  }
}
