//
//  Error.swift
//  iTunesSearchAPI
//
//  Created by Sven Bacia on 27.02.16.
//  Copyright © 2016 Sven Bacia. All rights reserved.
//

import Foundation

public enum Error: ErrorType {
  case InvalidSearchTerm
  case InvalidURL
  case ServerError(Int)
  case InvalidJSON
}
