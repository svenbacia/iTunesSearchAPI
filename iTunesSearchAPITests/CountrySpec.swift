//
//  CountrySpec.swift
//  iTunesSearchAPI
//
//  Created by Sven Bacia on 17.04.16.
//  Copyright © 2016 Sven Bacia. All rights reserved.
//

import Quick
import Nimble

@testable import iTunesSearchAPI

class CountrySpec: QuickSpec {
  override func spec() {
    describe("a country") {
      it("has a valid country code") {
        expect(Country.Chinese.code).to(equal("zh"))
        expect(Country.Dutch.code).to(equal("nl"))
        expect(Country.English.code).to(equal("en"))
        expect(Country.French.code).to(equal("fr"))
        expect(Country.German.code).to(equal("de"))
        expect(Country.Italian.code).to(equal("it"))
        expect(Country.Japanese.code).to(equal("ja"))
        expect(Country.Polish.code).to(equal("pl"))
      }
      
    }
  }
}
