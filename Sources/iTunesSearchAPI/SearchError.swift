//
//  Error.swift
//  iTunesSearchAPI
//
//  Created by Sven Bacia on 27.02.16.
//  Copyright © 2016 Sven Bacia. All rights reserved.
//

import Foundation

public extension iTunes {
    enum Error: Swift.Error {
        case unknown
        case invalidSearchTerm
        case invalidURL
        case invalidServerResponse
        case serverError(Int)
        case missingData
        case invalidJSON(Swift.Error)
    }
}
