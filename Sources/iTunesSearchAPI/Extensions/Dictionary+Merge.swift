//
//  Dictionary+Merge.swift
//  iTunesSearchAPI
//
//  Created by Sven Bacia on 16.04.16.
//  Copyright © 2016 Sven Bacia. All rights reserved.
//

import Foundation

extension Dictionary {
    mutating func unionInPlace(_ dictionary: [Key: Value]) {
    for (key, value) in dictionary {
      self[key] = value
    }
  }

  func union(_ dictionary: [Key: Value]) -> [Key: Value] {
    var dict = self
    dict.unionInPlace(dictionary)
    return dict
  }
}
