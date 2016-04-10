//
//  QueryItemConvertible.swift
//  iTunesSearchAPI
//
//  Created by Sven Bacia on 29.02.16.
//  Copyright © 2016 Sven Bacia. All rights reserved.
//

import Foundation

public protocol QueryItemConvertible {
  var queryItems: [NSURLQueryItem] { get }
}
