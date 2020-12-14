//
//  GitHubApi.swift
//  GitHubSwift
//
//  Created by Matthew Foster on 14/12/20.
//

import Foundation

enum GitHubApi {
    case commits(user: String,repo: String)
}

extension GitHubApi: EndpointType {
    var baseURL: URL {
        return URL(string: "https://api.github.com/repos")!
    }

    var path: String {
        switch self {
        case .commits(let user, let repo):
            return "/\(user)/\(repo)/commits"
        }
    }
}
