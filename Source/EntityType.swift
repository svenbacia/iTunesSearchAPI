//
//  EntityType.swift
//  iTunesSearchAPI
//
//  Created by Sven Bacia on 16.04.16.
//  Copyright © 2016 Sven Bacia. All rights reserved.
//

import Foundation

public protocol EntityType {
  var value: String { get }
  var parameter: [String : String] { get }
}

public extension EntityType {
  var parameter: [String : String] {
    return ["entity" : value]
  }
}
