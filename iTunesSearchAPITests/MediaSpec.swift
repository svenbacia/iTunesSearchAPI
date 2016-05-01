//
//  MediaSpec.swift
//  iTunesSearchAPI
//
//  Created by Sven Bacia on 01.05.16.
//  Copyright © 2016 Sven Bacia. All rights reserved.
//

import Quick
import Nimble

@testable import iTunesSearchAPI

class MediaSpec: QuickSpec {
  override func spec() {
    describe("a media type") {
      it("as parameter without entity") {
        expect(Media.Movie(nil).parameters).to(equal([ "media" : "movie" ]))
        expect(Media.Podcast(nil).parameters).to(equal([ "media" : "podcast" ]))
        expect(Media.Music(nil).parameters).to(equal([ "media" : "music" ]))
        expect(Media.MusicVideo(nil).parameters).to(equal([ "media" : "musicvideo" ]))
        expect(Media.AudioBook(nil).parameters).to(equal([ "media" : "audiobook" ]))
        expect(Media.ShortFilm(nil).parameters).to(equal([ "media" : "shortFilm" ]))
        expect(Media.TVShow(nil).parameters).to(equal([ "media" : "tvShow" ]))
        expect(Media.Software(nil).parameters).to(equal([ "media" : "software" ]))
        expect(Media.eBook(nil).parameters).to(equal([ "media" : "ebook" ]))
        expect(Media.All(nil).parameters).to(equal([ "media" : "all" ]))
      }
      
      it("as parameter with entity") {
        expect(Media.Movie(Entity.Movie).parameters).to(equal([ "media" : "movie", "entity" : "movie" ]))
      }
    }
  }
}
