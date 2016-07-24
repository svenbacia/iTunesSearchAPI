//
//  CountryTests.swift
//  iTunesSearchAPI
//
//  Created by Sven Bacia on 24.07.16.
//  Copyright © 2016 Sven Bacia. All rights reserved.
//

import XCTest

@testable import iTunesSearchAPI

class CountryTests: XCTestCase {
  
  func testCountryCodes() {
    XCTAssertEqual(Country.chinese.code, "zh")
    XCTAssertEqual(Country.dutch.code, "nl")
    XCTAssertEqual(Country.english.code, "en")
    XCTAssertEqual(Country.french.code, "fr")
    XCTAssertEqual(Country.german.code, "de")
    XCTAssertEqual(Country.italian.code, "it")
    XCTAssertEqual(Country.japanese.code, "ja")
    XCTAssertEqual(Country.polish.code, "pl")
  }
    
}
