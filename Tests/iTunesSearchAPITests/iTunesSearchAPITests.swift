//
//  iTunesSearchAPITest.swift
//  iTunesSearchAPI
//
//  Created by Sven Bacia on 24.07.16.
//  Copyright © 2016 Sven Bacia. All rights reserved.
//

import XCTest
@testable import iTunesSearchAPI

// swiftlint:disable:next type_name
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

		XCTAssertTrue(session.completedURLs.first!.absoluteString.starts(with: "https://itunes.apple.com/search?"))

		let components = URLComponents(url: session.completedURLs[0], resolvingAgainstBaseURL: false)!
		let queryItems = components.queryItems!
		XCTAssertEqual(2, queryItems.count)
		XCTAssertEqual(queryItems.first(where: { $0.name == "term" })!.value!, "Suits")
		XCTAssertEqual(queryItems.first(where: { $0.name == "media" })!.value!, "all")
    }

    func testSearchWithOptions() {
        let session = FakeURLSession.empty

        let client = iTunes(session: session, debug: true)
        let task = client.search(for: "Suits", options: Options(country: .germany), completion: { _ in })
        task?.resume()

		XCTAssertTrue(session.completedURLs.first!.absoluteString.starts(with: "https://itunes.apple.com/search?"))

		let components = URLComponents(url: session.completedURLs[0], resolvingAgainstBaseURL: false)!
		let queryItems = components.queryItems!
		XCTAssertEqual(3, queryItems.count)
		XCTAssertEqual(queryItems.first(where: { $0.name == "term" })!.value!, "Suits")
		XCTAssertEqual(queryItems.first(where: { $0.name == "media" })!.value!, "all")
		XCTAssertEqual(queryItems.first(where: { $0.name == "country" })!.value!, "de")
    }

    func testBasicLookupByID() {
        let session = FakeURLSession.empty

        let client = iTunes(session: session, debug: true)
        let task = client.lookup(by: .id("909253")) { _ in }
        task?.resume()

        XCTAssertEqual(session.completedURLs.first!.absoluteString, "https://itunes.apple.com/lookup?id=909253")
    }

    func testBasicLookupByIdWithOptions() {
        let session = FakeURLSession.empty

        let client = iTunes(session: session, debug: true)
        let task = client.lookup(by: .id("909253"), options: Options(country: .germany)) { _ in }
        task?.resume()

		XCTAssertTrue(session.completedURLs.first!.absoluteString.starts(with: "https://itunes.apple.com/lookup?"))

		let components = URLComponents(url: session.completedURLs[0], resolvingAgainstBaseURL: false)!
		let queryItems = components.queryItems!
		XCTAssertEqual(2, queryItems.count)
		XCTAssertEqual(queryItems.first(where: { $0.name == "id" })!.value!, "909253")
		XCTAssertEqual(queryItems.first(where: { $0.name == "country" })!.value!, "de")
    }
}
