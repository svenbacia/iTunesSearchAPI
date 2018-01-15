//
//  StringTests.swift
//  iTunesSearchAPI
//
//  Created by Sven Bacia on 24.07.16.
//  Copyright © 2016 Sven Bacia. All rights reserved.
//

import XCTest

@testable import iTunesSearchAPI

class StringTests: XCTestCase {

  func testURLEscaping() {
    let escaped = "Person of Interest".urlEscaped
    XCTAssertNotNil(escaped)
    XCTAssertEqual(escaped!, "Person%20of%20Interest")
  }

}
