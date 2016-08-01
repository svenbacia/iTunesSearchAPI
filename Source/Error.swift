//
//  Error.swift
//  iTunesSearchAPI
//
//  Created by Sven Bacia on 27.02.16.
//  Copyright © 2016 Sven Bacia. All rights reserved.
//

import Foundation

public enum SearchError: Error {
  case invalidSearchTerm
  case invalidURL
  case serverError(Int)
  case invalidJSON
}
