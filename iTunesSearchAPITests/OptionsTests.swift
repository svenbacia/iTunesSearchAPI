//
//  OptionsTests.swift
//  iTunesSearchAPI
//
//  Created by Sven Bacia on 24.07.16.
//  Copyright © 2016 Sven Bacia. All rights reserved.
//

import XCTest

@testable import iTunesSearchAPI

class OptionsTests: XCTestCase {

  func testOptionDefaults() {
    let options = Options()
    XCTAssertNotNil(options)
    XCTAssertNil(options.country)
    XCTAssertNil(options.includeExplicitContent)
    XCTAssertNil(options.language)
    XCTAssertNil(options.limit)
  }
  
  func testNilParameters() {
    let options = Options()
    XCTAssertNil(options.parameters)
  }
  
  func testAllParameters() {
    let options = Options(country: .germany,
                          limit: 20,
                          language: .english,
                          includeExplicitContent: true)
    
    let parameters = options.parameters
    
    XCTAssertNotNil(parameters)
    
    XCTAssertEqual(parameters!["country"], "de")
    XCTAssertEqual(parameters!["limit"], "20")
    XCTAssertEqual(parameters!["lang"], "en_us")
    XCTAssertEqual(parameters!["explicit"], "Yes")
  }

}
