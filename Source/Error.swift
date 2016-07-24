//
//  Error.swift
//  iTunesSearchAPI
//
//  Created by Sven Bacia on 27.02.16.
//  Copyright © 2016 Sven Bacia. All rights reserved.
//

import Foundation

public enum Error: ErrorProtocol {
  case invalidSearchTerm
  case invalidURL
  case serverError(Int)
  case invalidJSON
}
