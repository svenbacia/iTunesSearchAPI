//
//  iTunesSearchAPITests.swift
//  iTunesSearchAPITests
//
//  Created by Sven Bacia on 27.02.16.
//  Copyright © 2016 Sven Bacia. All rights reserved.
//

@testable import iTunesSearchAPI
import Quick
import Nimble

class SearchAPISpec: QuickSpec {
  
  override func spec() {
    it("singleton instance is not nil") {
      expect(iTunesSearchAPI.defaultInstance).notTo(beNil())
    }
    
    it("json is not nil") {
      waitUntil(timeout: 5.0) { done in
        iTunesSearchAPI.defaultInstance.search("Castle") { json, error in
          expect(json).notTo(beNil())
          done()
        }
      }
    }
    
  }
}
