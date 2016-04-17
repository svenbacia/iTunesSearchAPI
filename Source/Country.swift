//
//  Country.swift
//  iTunesSearchAPI
//
//  Created by Sven Bacia on 27.02.16.
//  Copyright © 2016 Sven Bacia. All rights reserved.
//

import Foundation

public enum Country {
  case Chinese
  case Dutch
  case English
  case French
  case German
  case Italian
  case Japanese
  case Polish
}

extension Country {
  var code: String {
    switch self {
    case .Chinese:
      return "zh"
    case .Dutch:
      return "nl"
    case .English:
      return "en"
    case .French:
      return "fr"
    case .German:
      return "de"
    case .Italian:
      return "it"
    case .Japanese:
      return "ja"
    case .Polish:
      return "pl"
    }
  }
}
