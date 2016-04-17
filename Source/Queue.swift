//
//  Queue.swift
//  iTunesSearchAPI
//
//  Created by Sven Bacia on 27.02.16.
//  Copyright © 2016 Sven Bacia. All rights reserved.
//

import Foundation

func mainQueue(block: () -> Void) {
  dispatch_async(dispatch_get_main_queue(), block)
}
