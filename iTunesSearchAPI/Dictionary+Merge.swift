//
//  Dictionary+Merge.swift
//  iTunesSearchAPI
//
//  Created by Sven Bacia on 16.04.16.
//  Copyright © 2016 Sven Bacia. All rights reserved.
//

import Foundation

extension Dictionary {
  mutating func unionInPlace(dictionary: Dictionary<Key, Value>) {
    for (key, value) in dictionary {
      self[key] = value
    }
  }
  
  func union(dictionary: Dictionary<Key, Value>) -> Dictionary<Key, Value> {
    var dict = self
    dict.unionInPlace(dictionary)
    return dict
  }
}