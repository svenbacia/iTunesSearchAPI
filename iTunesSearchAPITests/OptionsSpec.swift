//
//  OptionsSpec.swift
//  iTunesSearchAPI
//
//  Created by Sven Bacia on 17.04.16.
//  Copyright © 2016 Sven Bacia. All rights reserved.
//

import Quick
import Nimble

@testable import iTunesSearchAPI

class OptionsSpec: QuickSpec {
  override func spec() {
    describe("options") {
      it("are by default nil") {
        let options = Options()
        expect(options).notTo(beNil())
        expect(options.country).to(beNil())
        expect(options.includeExplicitContent).to(beNil())
        expect(options.language).to(beNil())
        expect(options.limit).to(beNil())
      }
    }
  }
}
