//
//  iTunesSearchAPITests.swift
//  iTunesSearchAPITests
//
//  Created by Sven Bacia on 27.02.16.
//  Copyright © 2016 Sven Bacia. All rights reserved.
//

import XCTest
@testable import iTunesSearchAPI

class iTunesSearchAPITests: XCTestCase {
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  // MARK: -
  
  func testDefaultInstance() {
    XCTAssertNotNil(iTunesSearchAPI.defaultInstance)
  }
  
  func testSearch() {
    
    let searchAPI   = iTunesSearchAPI.defaultInstance
    let expectation = expectationWithDescription("test search")
    
    searchAPI.search("Castle") { json, error in
      
      print("Result JSON: \(json)")
      
      expectation.fulfill()
    }
    
    waitForExpectationsWithTimeout(5.0, handler: nil)
  }
}
