//
//  LookupTypeTests.swift
//  iTunesSearchAPI
//
//  Created by Sven Bacia on 01.05.17.
//  Copyright © 2017 Sven Bacia. All rights reserved.
//

import XCTest

@testable import iTunesSearchAPI

class LookupTypeTests: XCTestCase {
    
    func testParameters() {
        let upc = LookupType.upc("720642462928")
        let isbn = LookupType.isbn("9780316069359")
        let id = LookupType.id("909253")
        
        XCTAssertEqual(upc.parameters, ["upc": "720642462928"])
        XCTAssertEqual(isbn.parameters, ["isbn": "9780316069359"])
        XCTAssertEqual(id.parameters, ["id": "909253"])
    }
}

