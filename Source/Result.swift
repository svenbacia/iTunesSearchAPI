//
//  Result.swift
//  iTunesSearchAPI
//
//  Created by Sven Bacia on 03.08.16.
//  Copyright © 2015 Sven Bacia. All rights reserved.
//

import Foundation

public enum Result<T, U> {
  case success(T)
  case failure(U)
  
  public var value: T? {
    if case .success(let value) = self {
      return value
    }
    return nil
  }
  
  public var error: U? {
    if case .failure(let error) = self {
      return error
    }
    return nil
  }
  
}
