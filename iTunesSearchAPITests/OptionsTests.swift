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

}
