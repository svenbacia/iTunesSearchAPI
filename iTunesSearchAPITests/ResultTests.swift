//
//  ResultTests.swift
//  iTunesSearchAPI
//
//  Created by Sven Bacia on 27.03.17.
//  Copyright © 2017 Sven Bacia. All rights reserved.
//

import XCTest

@testable import iTunesSearchAPI

class ResultTests: XCTestCase {
  
  func testSuccess() {
    let result = Result<Int, Int>.success(1)
    XCTAssertEqual(result.value, 1)
    XCTAssertNil(result.error)
  }
  
  func testFailure() {
    let result = Result<Int, Int>.failure(0)
    XCTAssertNil(result.value)
    XCTAssertEqual(result.error, 0)
  }
  
}
