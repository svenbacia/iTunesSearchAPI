//
//  DictionaryTests.swift
//  iTunesSearchAPI
//
//  Created by Sven Bacia on 24.07.16.
//  Copyright © 2016 Sven Bacia. All rights reserved.
//

import XCTest

@testable import iTunesSearchAPI

class DictionaryTests: XCTestCase {
  func testUnionInPlace() {
    
    var dictionary = [ "media" : "movie" ]
    dictionary.unionInPlace([ "entity" : "movie" ])
    
    XCTAssertEqual(dictionary, [ "media" : "movie", "entity" : "movie" ])
  }
  
  func testUnion() {
    
    let media  = [ "media" : "movie" ]
    let entity = [ "entity" : "movie" ]
    
    let dictionary = media.union(entity)
    
    XCTAssertEqual(dictionary, [ "media" : "movie", "entity" : "movie" ])
  }
}
