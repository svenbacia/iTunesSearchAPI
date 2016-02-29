//
//  Entity.swift
//  iTunesSearchAPI
//
//  Created by Sven Bacia on 28.02.16.
//  Copyright © 2016 Sven Bacia. All rights reserved.
//

import Foundation

public protocol Entity: CustomStringConvertible, QueryItemConvertible {}

extension Entity {
  public var queryItems: [NSURLQueryItem] {
    return [NSURLQueryItem(name: "entity", value: description)]
  }
}
