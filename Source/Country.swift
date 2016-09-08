//
//  Country.swift
//  iTunesSearchAPI
//
//  Created by Sven Bacia on 27.02.16.
//  Copyright © 2016 Sven Bacia. All rights reserved.
//

import Foundation

public enum Country: String {
  case australia     = "au"
  case canada        = "ca"
  case china         = "zh"
  case denmark       = "dk"
  case france        = "fr"
  case germany       = "de"
  case italy         = "it"
  case japan         = "ja"
  case netherlands   = "nl"
  case poland        = "pl"
  case spain         = "es"
  case sweden        = "se"
  case switzerland   = "ch"
  case unitedKingdom = "gb"
  case unitedStates  = "us"
}

extension Country {
  public var code: String {
    return rawValue
  }
}
