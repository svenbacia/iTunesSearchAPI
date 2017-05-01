//
//  iTunesSearchAPITest.swift
//  iTunesSearchAPI
//
//  Created by Sven Bacia on 24.07.16.
//  Copyright © 2016 Sven Bacia. All rights reserved.
//

import XCTest

@testable import iTunesSearchAPI

class iTunesSearchAPITests: XCTestCase {
    
    func testInit_DefaultValues() {
        let tunes = iTunes()
        XCTAssertFalse(tunes.isDebug)
    }
    
    func testInit_DebugTrue() {
        let tunes = iTunes(debug: true)
        XCTAssertTrue(tunes.isDebug)
    }
    
    func testBasicSearch() {
        let session = FakeURLSession.empty
        
        let client = iTunes(session: session, debug: true)
        let task = client.search(for: "Suits") { _ in }
        task?.resume()
        
        XCTAssertEqual(session.completedURLs.first!.absoluteString, "https://itunes.apple.com/search?term=Suits&media=all")
    }
    
    func testBasicLookupByID() {
        let session = FakeURLSession.empty
        
        let client = iTunes(session: session, debug: true)
        let task = client.lookup(by: .id("909253")) { _ in }
        task?.resume()
        
        XCTAssertEqual(session.completedURLs.first!.absoluteString, "https://itunes.apple.com/lookup?id=909253")
    }
}
