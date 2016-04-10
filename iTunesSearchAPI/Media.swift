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
  case Movie(String, includeEntities: Entity?)
  case Podcast(String, includeEntities: Entity?)
  case Music(String, includeEntities: Entity?)
  case MusicVideo(String, includeEntities: Entity?)
  case AudioBook(String, includeEntities: Entity?)
  case ShortFilm(String, includeEntities: Entity?)
  case TVShow(String, includeEntities: TVShowEntity?)
  case Software(String, includeEntities: Entity?)
  case eBook(String, includeEntities: Entity?)
  case Everything(String, includeEntities: Entity?)
  
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
    case .Everything:
      return "all"
    }
  }
}

extension Media: QueryItemConvertible {
  public var queryItems: [NSURLQueryItem] {
    switch self {
    case .Movie(let title, let entities):
      return queryItemsFor(title, includedEntities: entities)
    case .Podcast(let title, let entities):
      return queryItemsFor(title, includedEntities: entities)
    case .Music(let title, let entities):
      return queryItemsFor(title, includedEntities: entities)
    case .MusicVideo(let title, let entities):
      return queryItemsFor(title, includedEntities: entities)
    case .AudioBook(let title, let entities):
      return queryItemsFor(title, includedEntities: entities)
    case .ShortFilm(let title, let entities):
      return queryItemsFor(title, includedEntities: entities)
    case .TVShow(let title, let entities):
      return queryItemsFor(title, includedEntities: entities)
    case .Software(let title, let entities):
      return queryItemsFor(title, includedEntities: entities)
    case .eBook(let title, let entities):
      return queryItemsFor(title, includedEntities: entities)
    case .Everything(let title, let entities):
      return queryItemsFor(title, includedEntities: entities)
    }
  }
  
  private func queryItemsFor(title: String, includedEntities entities: Entity?) -> [NSURLQueryItem] {
    // make sure that the title is valid to use in an url
    guard let escapedTitle = title.URLEscaped else { return [] }
    
    // create query item for the search term
    let termQueryItem = NSURLQueryItem(name: "term", value: escapedTitle)
    
    // create query item for selected media type
    let mediaQueryItem = NSURLQueryItem(name: "media", value: value)
    
    // add term and media query item to one array
    let requiredQueryItems = [termQueryItem, mediaQueryItem]
    
    // create query items for possible entities when needed
    if let entityQueryItems = entities?.queryItems {
      return requiredQueryItems + entityQueryItems
    }
    
    // otherwise return only the term
    return requiredQueryItems
  }
}
