//
//  Country.swift
//  iTunesSearchAPI
//
//  Created by Sven Bacia on 27.02.16.
//  Copyright © 2016 Sven Bacia. All rights reserved.
//

import Foundation

public enum Country {
  case australia
  case canada
  case china
  case france
  case germany
  case italy
  case japan
  case netherlands
  case poland
  case unitedKingdom
  case unitedStates
}

extension Country {
  var code: String {
    switch self {
    case .australia:
      return "au"
    case .canada:
      return "ca"
    case .china:
      return "zh"
    case .netherlands:
      return "nl"
    case .unitedKingdom:
      return "gb"
    case .france:
      return "fr"
    case .germany:
      return "de"
    case .italy:
      return "it"
    case .japan:
      return "ja"
    case .poland:
      return "pl"
    case .unitedStates:
      return "us"
    }
  }
}
