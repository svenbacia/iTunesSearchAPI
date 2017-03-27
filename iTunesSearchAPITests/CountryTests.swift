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
    XCTAssertEqual(Country.china.code, "cn")
    XCTAssertEqual(Country.netherlands.code, "nl")
    XCTAssertEqual(Country.unitedStates.code, "us")
    XCTAssertEqual(Country.france.code, "fr")
    XCTAssertEqual(Country.germany.code, "de")
    XCTAssertEqual(Country.italy.code, "it")
    XCTAssertEqual(Country.japan.code, "jp")
    XCTAssertEqual(Country.poland.code, "pl")
    XCTAssertEqual(Country.australia.code, "au")
    XCTAssertEqual(Country.canada.code, "ca")
    XCTAssertEqual(Country.unitedKingdom.code, "gb")
    XCTAssertEqual(Country.denmark.code, "dk")
    XCTAssertEqual(Country.sweden.code, "se")
    XCTAssertEqual(Country.spain.code, "es")
    XCTAssertEqual(Country.switzerland.code, "ch")
  }
    
}
