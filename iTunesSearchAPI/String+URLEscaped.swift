//
//  String+URLEscaped.swift
//  iTunesSearchAPI
//
//  Created by Sven Bacia on 29.02.16.
//  Copyright © 2016 Sven Bacia. All rights reserved.
//

import Foundation

extension String {
  var URLEscapedString: String? {
    return stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet())
  }
}
