//
//  EntitiyTests.swift
//  iTunesSearchAPI
//
//  Created by Sven Bacia on 24.07.16.
//  Copyright © 2016 Sven Bacia. All rights reserved.
//

import XCTest

@testable import iTunesSearchAPI

class EntitiyTests: XCTestCase {

  func testEntityDescriptions() {
    XCTAssertEqual(Entity.movie.value, "movie")
    XCTAssertEqual(Entity.album.value, "album")
    XCTAssertEqual(Entity.allArtist.value, "allArtist")
    XCTAssertEqual(Entity.podcast.value, "podcast")
    XCTAssertEqual(Entity.musicVideo.value, "musicVideo")
    XCTAssertEqual(Entity.mix.value, "mix")
    XCTAssertEqual(Entity.audiobook.value, "audiobook")
    XCTAssertEqual(Entity.tvSeason.value, "tvSeason")
    XCTAssertEqual(Entity.allTrack.value, "allTrack")
    XCTAssertEqual(Entity.movieArtist.value, "movieArtist")
    XCTAssertEqual(Entity.podcastAuthor.value, "podcastAuthor")
    XCTAssertEqual(Entity.musicArtist.value, "musicArtist")
    XCTAssertEqual(Entity.musicTrack.value, "musicTrack")
    XCTAssertEqual(Entity.musicSong.value, "musicSong")
    XCTAssertEqual(Entity.audiobookAuthor.value, "audiobookAuthor")
    XCTAssertEqual(Entity.shortFilmArtist.value, "shortFilmArtist")
    XCTAssertEqual(Entity.shortFilm.value, "shortFilm")
    XCTAssertEqual(Entity.tvEpisode.value, "tvEpisode")
    XCTAssertEqual(Entity.software.value, "software")
    XCTAssertEqual(Entity.iPadSoftware.value, "iPadSoftware")
    XCTAssertEqual(Entity.macSoftware.value, "macSoftware")
    XCTAssertEqual(Entity.eBook.value, "ebook")
  }

}
