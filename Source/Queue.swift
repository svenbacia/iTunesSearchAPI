//
//  Queue.swift
//  iTunesSearchAPI
//
//  Created by Sven Bacia on 27.02.16.
//  Copyright © 2016 Sven Bacia. All rights reserved.
//

import Foundation

func mainQueue(_ block: () -> Void) {
  DispatchQueue.main.async(execute: block)
}
