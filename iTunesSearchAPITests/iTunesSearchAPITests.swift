//
//  iTunesSearchAPITest.swift
//  iTunesSearchAPI
//
//  Created by Sven Bacia on 24.07.16.
//  Copyright © 2016 Sven Bacia. All rights reserved.
//

import XCTest

@testable import iTunesSearchAPI

class iTunesSearchAPITests: XCTestCase {
  
  func testSingleton_notNil() {
    let search = iTunesSearchAPI.defaultSearch
    XCTAssertNotNil(search)
  }

    
}
