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
    XCTAssertEqual(Country.china.code, "zh")
    XCTAssertEqual(Country.netherlands.code, "nl")
    XCTAssertEqual(Country.unitedStates.code, "us")
    XCTAssertEqual(Country.france.code, "fr")
    XCTAssertEqual(Country.germany.code, "de")
    XCTAssertEqual(Country.italy.code, "it")
    XCTAssertEqual(Country.japan.code, "ja")
    XCTAssertEqual(Country.poland.code, "pl")
    XCTAssertEqual(Country.australia.code, "au")
    XCTAssertEqual(Country.canada.code, "ca")
    XCTAssertEqual(Country.unitedKingdom.code, "gb")
  }
    
}
