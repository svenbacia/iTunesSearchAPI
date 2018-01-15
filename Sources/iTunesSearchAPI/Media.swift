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

  case movie(Entity?)
  case podcast(Entity?)
  case music(Entity?)
  case musicVideo(Entity?)
  case audioBook(Entity?)
  case shortFilm(Entity?)
  case tvShow(Entity?)
  case software(Entity?)
  case eBook(Entity?)
  case all(Entity?)

  fileprivate var value: String {
    switch self {
    case .movie:
      return "movie"
    case .podcast:
      return "podcast"
    case .music:
      return "music"
    case .musicVideo:
      return "musicvideo"
    case .audioBook:
      return "audiobook"
    case .shortFilm:
      return "shortFilm"
    case .tvShow:
      return "tvShow"
    case .software:
      return "software"
    case .eBook:
      return "ebook"
    case .all:
      return "all"
    }
  }

  fileprivate var entity: Entity? {
    switch self {
    case .movie(let entity):
      return entity
    case .podcast(let entity):
      return entity
    case .music(let entity):
      return entity
    case .musicVideo(let entity):
      return entity
    case .audioBook(let entity):
      return entity
    case .shortFilm(let entity):
      return entity
    case .tvShow(let entity):
      return entity
    case .software(let entity):
      return entity
    case .eBook(let entity):
      return entity
    case .all(let entity):
      return entity
    }
  }
}

extension Media {

  var parameters: [String: String] {

    var media = ["media": value]

    if let entity = entity?.parameter {
      media.unionInPlace(entity)
    }

    return media
  }
}
