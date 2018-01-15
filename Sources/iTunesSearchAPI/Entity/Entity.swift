//
//  Entity.swift
//  iTunesSearchAPI
//
//  Created by Sven Bacia on 16.04.16.
//  Copyright © 2016 Sven Bacia. All rights reserved.
//

import Foundation

/// The type of results you want returned, relative to the specified media type.
/// For example: movieArtist for a movie media type search.
/// The default is the track entity associated with the specified media type.
public enum Entity {
  // All
  case movie
  case album
  case allArtist
  case podcast
  case musicVideo
  case mix
  case audiobook
  case tvSeason
  case allTrack

  // Movie
  case movieArtist

  // Podcast
  case podcastAuthor

  // Music
  case musicArtist
  case musicTrack
  case musicSong

  // Audiobook
  case audiobookAuthor

  // Shortfilm
  case shortFilmArtist
  case shortFilm

  // TVShow
  case tvEpisode

  // Software
  case software
  case iPadSoftware
  case macSoftware

  // eBook
  case eBook
}

extension Entity: EntityType {
  public var value: String {
    switch self {
    case .movie:
      return "movie"
    case .album:
      return "album"
    case .allArtist:
      return "allArtist"
    case .podcast:
      return "podcast"
    case .musicVideo:
      return "musicVideo"
    case .mix:
      return "mix"
    case .audiobook:
      return "audiobook"
    case .tvSeason:
      return "tvSeason"
    case .allTrack:
      return "allTrack"
    case .movieArtist:
      return "movieArtist"
    case .podcastAuthor:
      return "podcastAuthor"
    case .musicArtist:
      return "musicArtist"
    case .musicTrack:
      return "musicTrack"
    case .musicSong:
      return "musicSong"
    case .audiobookAuthor:
      return "audiobookAuthor"
    case .shortFilmArtist:
      return "shortFilmArtist"
    case .shortFilm:
      return "shortFilm"
    case .tvEpisode:
      return "tvEpisode"
    case .software:
      return "software"
    case .iPadSoftware:
      return "iPadSoftware"
    case .macSoftware:
      return "macSoftware"
    case .eBook:
      return "ebook"
    }
  }
}
