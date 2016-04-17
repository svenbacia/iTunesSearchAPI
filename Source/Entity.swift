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
  case Movie
  case Album
  case AllArtist
  case Podcast
  case MusicVideo
  case Mix
  case Audiobook
  case TVSeason
  case AllTrack
  
  // Movie
  case MovieArtist
  
  // Podcast
  case PodcastAuthor
  
  // Music
  case MusicArtist
  case MusicTrack
  case MusicSong
  
  // Audiobook
  case AudiobookAuthor
  
  // Shortfilm
  case ShortFilmArtist
  case ShortFilm
  
  // TVShow
  case TVEpisode
  
  // Software
  case Software
  case iPadSoftware
  case MacSoftware
  
  // eBook
  case eBook
}

extension Entity: EntityType {
  public var value: String {
    switch self {
    case .Movie:
      return "movie"
    case .Album:
      return "album"
    case .AllArtist:
      return "allArtist"
    case .Podcast:
      return "podcast"
    case .MusicVideo:
      return "musicVideo"
    case .Mix:
      return "mix"
    case .Audiobook:
      return "audiobook"
    case .TVSeason:
      return "tvSeason"
    case .AllTrack:
      return "allTrack"
    case .MovieArtist:
      return "movieArtist"
    case .PodcastAuthor:
      return "podcastAuthor"
    case .MusicArtist:
      return "musicArtist"
    case .MusicTrack:
      return "musicTrack"
    case .MusicSong:
      return "musicSong"
    case .AudiobookAuthor:
      return "audiobookAuthor"
    case .ShortFilmArtist:
      return "shortFilmArtist"
    case .ShortFilm:
      return "shortFilm"
    case .TVEpisode:
      return "tvEpisode"
    case .Software:
      return "software"
    case .iPadSoftware:
      return "iPadSoftware"
    case .MacSoftware:
      return "macSoftware"
    case .eBook:
      return "ebook"
    }
  }
}
