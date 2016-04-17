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
    
    let search = iTunesSearchAPI.defaultSearch
    
    it("singleton instance is not nil") {
      expect(search).notTo(beNil())
    }
    
    it("response json is not nil") {
      waitUntil(timeout: 5.0) { done in
        search.searchFor("Castle", ofType: .TVShow(Entity.TVSeason)) { json, error in
          print(json)
          done()
        }
      }
    }
    
  }
}
