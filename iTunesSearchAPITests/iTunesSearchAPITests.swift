//
//  iTunesSearchAPITests.swift
//  iTunesSearchAPITests
//
//  Created by Sven Bacia on 17.04.16.
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
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
      let search = iTunesSearchAPI.defaultSearch
      search.searchFor("Castle", ofType: .TVShow(Entity.TVSeason)) { json, error in
        print(json)
      }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
