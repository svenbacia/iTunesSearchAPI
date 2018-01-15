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

        XCTAssertEqual(session.completedURLs.first!.absoluteString, "https://itunes.apple.com/search?term=Suits&media=all")
    }

    func testSearchWithOptions() {
        let session = FakeURLSession.empty

        let client = iTunes(session: session, debug: true)
        let task = client.search(for: "Suits", options: Options(country: .germany), completion: { _ in })
        task?.resume()

        XCTAssertEqual(session.completedURLs.first!.absoluteString, "https://itunes.apple.com/search?country=de&term=Suits&media=all")
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

        XCTAssertEqual(session.completedURLs.first!.absoluteString, "https://itunes.apple.com/lookup?id=909253&country=de")
    }

    func testSearch_withServerIssue() {
        let session = FakeURLSession.serverIssue

        let client = iTunes(session: session, debug: true)
        let task = client.search(for: "Suits") { _ in }
        task?.resume()

        XCTAssertEqual(session.completedURLs.first!.absoluteString, "https://itunes.apple.com/search?term=Suits&media=all")
    }

    func testSearch_withUnknownResponse() {
        let session = FakeURLSession.invalidResponse

        let client = iTunes(session: session, debug: true)
        let task = client.search(for: "Suits") { _ in }
        task?.resume()

        XCTAssertEqual(session.completedURLs.first!.absoluteString, "https://itunes.apple.com/search?term=Suits&media=all")
    }

    func testSearch_withInvalidJSON() {
        let session = FakeURLSession.invalidJSON

        let client = iTunes(session: session, debug: true)
        let task = client.search(for: "Suits") { _ in }
        task?.resume()

        XCTAssertEqual(session.completedURLs.first!.absoluteString, "https://itunes.apple.com/search?term=Suits&media=all")
    }

    func testSearch_withMissingData() {
        let session = FakeURLSession { (url) -> (iTunes.Result<(Data?, URLResponse?), iTunes.Error>) in
            let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)
            return (iTunes.Result.success((nil, response)))
        }

        let client = iTunes(session: session, debug: true)
        let task = client.search(for: "Suits") { _ in }
        task?.resume()

        XCTAssertEqual(session.completedURLs.first!.absoluteString, "https://itunes.apple.com/search?term=Suits&media=all")
    }
}
