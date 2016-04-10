//
//  TVShowEntity.swift
//  iTunesSearchAPI
//
//  Created by Sven Bacia on 29.02.16.
//  Copyright © 2016 Sven Bacia. All rights reserved.
//

import Foundation

public struct TVShowEntity: OptionSetType, Entity {
  
  // MARK: - Private Extended Type
  
  private enum EntityType: Int, CustomStringConvertible {
    case Episode = 1
    case Season  = 2
    
    static var allTypes: [EntityType] {
      return [.Episode, .Season]
    }
    
    var description: String {
      switch self {
      case .Episode:
        return "tvEpisode"
      case .Season:
        return "tvSeason"
      }
    }
  }
  
  // MARK: - Options
  
  /// Default Returns enough info to match locally.
  public static let Episode = TVShowEntity(.Episode)
  
  /// Minimal info and all images.
  public static let Season = TVShowEntity(.Season)
  
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
      .filter { self.contains(TVShowEntity($0)) }
      .reduce("") { memo, currentType in
        memo == "" ? "\(currentType)" : "\(memo),\(currentType)"
    }
  }
  
}
