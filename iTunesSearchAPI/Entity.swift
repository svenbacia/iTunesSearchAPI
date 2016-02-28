//
//  Entity.swift
//  iTunesSearchAPI
//
//  Created by Sven Bacia on 28.02.16.
//  Copyright © 2016 Sven Bacia. All rights reserved.
//

import Foundation

public struct Entity: OptionSetType {
  
  // MARK: - Private Extended Type
  
  private enum EntityType: Int, CustomStringConvertible {
    case TVEpisode = 1
    case TVSeason  = 2
    
    static var allTypes: [EntityType] {
      return [.TVEpisode, .TVSeason]
    }
    
    var description: String {
      switch self {
      case .TVEpisode:
        return "tvEpisode"
      case .TVSeason:
          return "tvSeason"
      }
    }
  }
  
  // MARK: - Options
  
  /// Default Returns enough info to match locally.
  public static let TVEpisode = Entity(.TVEpisode)
  
  /// Minimal info and all images.
  public static let TVSeason = Entity(.TVSeason)
  
  // MARK: - Properties
  
  public let rawValue: Int
  
  // MARK: - Init
  
  public init(rawValue: Int) {
    self.rawValue = rawValue
  }
  
  private init(_ entityType: EntityType) {
    self.rawValue = entityType.rawValue
  }
  
  // MARK: - CustomStringConvertible
  
  public var description: String {
    return EntityType.allTypes
      .filter { self.contains(Entity($0)) }
      .reduce("") { memo, currentType in
        memo == "" ? "\(currentType)" : "\(memo),\(currentType)"
    }
  }
}

extension Entity {
  /// Converts the extended information into an array of query items.
  var queryItem: NSURLQueryItem {
    return NSURLQueryItem(name: "entity", value: description)
  }
}
