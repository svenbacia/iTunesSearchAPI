//
//  FakeSession.swift
//  iTunesSearchAPI
//
//  Created by Sven Bacia on 01.05.17.
//  Copyright © 2017 Sven Bacia. All rights reserved.
//

import Foundation
import iTunesSearchAPI

final class FakeURLSession: URLSession {
    
    // MARK: - Types
    
    private final class Task: URLSessionDataTask {
        
        private let completion: () -> Void
        
        init(completion: @escaping () -> Void) {
            self.completion = completion
            super.init()
        }
    
        override func resume() {
            completion()
        }
    }
    
    // MARK: - Properties
    
    private let handler: (URL) -> (Result<(Data?, URLResponse?), SearchError>)
    
    var completedURLs = [URL]()
    
    // MARK: - Init
    
    init(handler: @escaping (URL) -> (Result<(Data?, URLResponse?), SearchError>)) {
        self.handler = handler
    }
    
    // MARK: - Task
    
    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return Task {
            self.completedURLs.append(url)
            switch self.handler(url) {
            case .success(let data, let response):
                completionHandler(data, response, nil)
            case .failure(let error):
                completionHandler(nil, nil, error)
            }
        }
    }
}

extension FakeURLSession {
    
    static var empty: FakeURLSession {
        return FakeURLSession { url in
            let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)
            let data = try? JSONSerialization.data(withJSONObject: [:])
            return Result.success((data, response))
        }
    }
    
    static var serverIssue: FakeURLSession {
        return FakeURLSession { url in
            let response = HTTPURLResponse(url: url, statusCode: 500, httpVersion: nil, headerFields: nil)
            return Result.success((nil, response))
        }
    }
    
    static var invalidResponse: FakeURLSession {
        return FakeURLSession { url in
            return Result.failure(.unknown)
        }
    }
    
    static var invalidJSON: FakeURLSession {
        return FakeURLSession { url in
            let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)
            let data = Data(base64Encoded: "Invalid")
            return Result.success((data, response))
        }
    }
}
