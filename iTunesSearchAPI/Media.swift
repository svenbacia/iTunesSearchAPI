//
//  Media.swift
//  iTunesSearchAPI
//
//  Created by Sven Bacia on 27.02.16.
//  Copyright © 2016 Sven Bacia. All rights reserved.
//

import Foundation

/// The media type you want to search for. The default is all.
public enum Media {
  
  case Movie(Entity?)
  case Podcast(Entity?)
  case Music(Entity?)
  case MusicVideo(Entity?)
  case AudioBook(Entity?)
  case ShortFilm(Entity?)
  case TVShow(Entity?)
  case Software(Entity?)
  case eBook(Entity?)
  case All(Entity?)
  
  private var value: String {
    switch self {
    case .Movie:
      return "movie"
    case .Podcast:
      return "podcast"
    case .Music:
      return "music"
    case .MusicVideo:
      return "musicvideo"
    case .AudioBook:
      return "audiobook"
    case .ShortFilm:
      return "shortFilm"
    case .TVShow:
      return "tvShow"
    case .Software:
      return "software"
    case .eBook:
      return "ebook"
    case .All:
      return "all"
    }
  }
  
  private var entity: Entity? {
    switch self {
    case .Movie(let entity):
      return entity
    case .Podcast(let entity):
      return entity
    case .Music(let entity):
      return entity
    case .MusicVideo(let entity):
      return entity
    case .AudioBook(let entity):
      return entity
    case .ShortFilm(let entity):
      return entity
    case .TVShow(let entity):
      return entity
    case .Software(let entity):
      return entity
    case .eBook(let entity):
      return entity
    case .All(let entity):
      return entity
    }
  }
}

extension Media {

  var parameters: [String : String] {
    
    var media = ["media" : value]
    
    if let entity = entity?.parameter {
      media.unionInPlace(entity)
    }
    
    return media
  }
}
