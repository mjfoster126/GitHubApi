//
//  Response.swift
//  GitHubSwift
//
//  Created by Matthew Foster on 14/12/20.
//

import Foundation

struct Response {
    fileprivate var data: Data
    init(data: Data) {
        self.data = data
    }
}

extension Response {
    public func decode<T: Codable>(_ type: T.Type) -> [T]? {
        let jsonDecoder = JSONDecoder()
        do {
            let response = try jsonDecoder.decode([T].self, from: data)
            return response
        } catch {
            return nil
        }
    }
}
