//
//  MediaTests.swift
//  iTunesSearchAPI
//
//  Created by Sven Bacia on 24.07.16.
//  Copyright © 2016 Sven Bacia. All rights reserved.
//

import XCTest

@testable import iTunesSearchAPI

class MediaTests: XCTestCase {

  func testParameters() {
    XCTAssertEqual(Media.movie(nil).parameters, [ "media": "movie" ])
    XCTAssertEqual(Media.podcast(nil).parameters, [ "media": "podcast" ])
    XCTAssertEqual(Media.music(nil).parameters, [ "media": "music" ])
    XCTAssertEqual(Media.musicVideo(nil).parameters, [ "media": "musicvideo" ])
    XCTAssertEqual(Media.audioBook(nil).parameters, [ "media": "audiobook" ])
    XCTAssertEqual(Media.shortFilm(nil).parameters, [ "media": "shortFilm" ])
    XCTAssertEqual(Media.tvShow(nil).parameters, [ "media": "tvShow" ])
    XCTAssertEqual(Media.software(nil).parameters, [ "media": "software" ])
    XCTAssertEqual(Media.eBook(nil).parameters, [ "media": "ebook" ])
    XCTAssertEqual(Media.all(nil).parameters, [ "media": "all" ])
  }

  func testParameterWithEntitiy() {
    XCTAssertEqual(Media.movie(.movie).parameters, [ "media": "movie", "entity": "movie" ])
  }

}
