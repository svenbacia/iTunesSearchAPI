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
  
  func testInit_DebugFalse() {
    let tunes = iTunes()
    XCTAssertFalse(tunes.isDebug)
  }
  
  func testInit_DebugTrue() {
    let tunes = iTunes(debug: true)
    XCTAssertTrue(tunes.isDebug)
  }

}
