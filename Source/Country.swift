//
//  Country.swift
//  iTunesSearchAPI
//
//  Created by Sven Bacia on 27.02.16.
//  Copyright © 2016 Sven Bacia. All rights reserved.
//

import Foundation

public enum Country {
  case chinese
  case dutch
  case english
  case french
  case german
  case italian
  case japanese
  case polish
}

extension Country {
  var code: String {
    switch self {
    case .chinese:
      return "zh"
    case .dutch:
      return "nl"
    case .english:
      return "en"
    case .french:
      return "fr"
    case .german:
      return "de"
    case .italian:
      return "it"
    case .japanese:
      return "ja"
    case .polish:
      return "pl"
    }
  }
}
