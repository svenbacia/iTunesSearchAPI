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
    
    private let handler: (URL) -> (iTunes.Result<(Data?, URLResponse?), iTunes.Error>)
    
    var completedURLs = [URL]()
    
    // MARK: - Init
    
    init(handler: @escaping (URL) -> (iTunes.Result<(Data?, URLResponse?), iTunes.Error>)) {
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
            return iTunes.Result.success((data, response))
        }
    }
    
    static var serverIssue: FakeURLSession {
        return FakeURLSession { url in
            let response = HTTPURLResponse(url: url, statusCode: 500, httpVersion: nil, headerFields: nil)
            return iTunes.Result.success((nil, response))
        }
    }
    
    static var invalidResponse: FakeURLSession {
        return FakeURLSession { url in
            return iTunes.Result.failure(.unknown)
        }
    }
    
    static var invalidJSON: FakeURLSession {
        return FakeURLSession { url in
            let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)
            let data = Data(capacity: 8)
            return iTunes.Result.success((data, response))
        }
    }
}
