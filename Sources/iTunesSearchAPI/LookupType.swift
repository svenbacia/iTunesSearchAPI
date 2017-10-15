//
//  LookupType.swift
//  iTunesSearchAPI
//
//  Created by Sven Bacia on 01.05.17.
//  Copyright © 2017 Sven Bacia. All rights reserved.
//

import Foundation

public enum LookupType {
    case upc(String)
    case isbn(String)
    case id(String)
    
    var parameters: [String: String] {
        switch self {
        case .upc(let upc):
            return ["upc": upc]
        case .isbn(let isbn):
            return ["isbn": isbn]
        case .id(let id):
            return ["id": id]
        }
    }
}
