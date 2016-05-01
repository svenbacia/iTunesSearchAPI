//
//  EntitySpec.swift
//  iTunesSearchAPI
//
//  Created by Sven Bacia on 01.05.16.
//  Copyright © 2016 Sven Bacia. All rights reserved.
//

import Quick
import Nimble

@testable import iTunesSearchAPI

class EntitySpec: QuickSpec {
  override func spec() {
    describe("an entity") {
      it("represented as value") {
        expect(Entity.Movie.value).to(equal("movie"))
        expect(Entity.Album.value).to(equal("album"))
        expect(Entity.AllArtist.value).to(equal("allArtist"))
        expect(Entity.Podcast.value).to(equal("podcast"))
        expect(Entity.MusicVideo.value).to(equal("musicVideo"))
        expect(Entity.Mix.value).to(equal("mix"))
        expect(Entity.Audiobook.value).to(equal("audiobook"))
        expect(Entity.TVSeason.value).to(equal("tvSeason"))
        expect(Entity.AllTrack.value).to(equal("allTrack"))
        expect(Entity.MovieArtist.value).to(equal("movieArtist"))
        expect(Entity.PodcastAuthor.value).to(equal("podcastAuthor"))
        expect(Entity.MusicArtist.value).to(equal("musicArtist"))
        expect(Entity.MusicTrack.value).to(equal("musicTrack"))
        expect(Entity.MusicSong.value).to(equal("musicSong"))
        expect(Entity.AudiobookAuthor.value).to(equal("audiobookAuthor"))
        expect(Entity.ShortFilmArtist.value).to(equal("shortFilmArtist"))
        expect(Entity.ShortFilm.value).to(equal("shortFilm"))
        expect(Entity.TVEpisode.value).to(equal("tvEpisode"))
        expect(Entity.Software.value).to(equal("software"))
        expect(Entity.iPadSoftware.value).to(equal("iPadSoftware"))
        expect(Entity.MacSoftware.value).to(equal("macSoftware"))
        expect(Entity.eBook.value).to(equal("ebook"))
      }
    }
  }
}
