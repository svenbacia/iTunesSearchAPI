//
//  SearchSpec.swift
//  iTunesSearchAPI
//
//  Created by Sven Bacia on 17.04.16.
//  Copyright © 2016 Sven Bacia. All rights reserved.
//

import Quick
import Nimble

@testable import iTunesSearchAPI

class SearchSpec: QuickSpec {
  override func spec() {
    
    describe("search") {
      
      let search = iTunesSearchAPI.defaultSearch
      
      it("singleton is never nil") {
        expect(search).toNot(beNil())
      }
      
      it("returns a json response") {
        waitUntil(timeout: 5.0) { done in
          search.searchFor("Castle", ofType: .TVShow(Entity.TVSeason)) { json, error in
            print(json)
            done()
          }
        }
      }
    }
    
  }
}
