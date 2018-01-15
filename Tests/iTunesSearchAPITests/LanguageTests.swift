//
//  LanguageTests.swift
//  iTunesSearchAPI
//
//  Created by Sven Bacia on 25.07.16.
//  Copyright © 2016 Sven Bacia. All rights reserved.
//

import XCTest

@testable import iTunesSearchAPI

class LanguageTests: XCTestCase {

  func testLanguageCodes() {
    XCTAssertEqual(Language.english.rawValue, "en_us")
    XCTAssertEqual(Language.japanese.rawValue, "ja_jp")
  }

}
