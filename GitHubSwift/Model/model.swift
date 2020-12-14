//
//  model.swift
//  GitHubSwift
//
//  Created by Matthew Foster on 13/12/20.
//

import Foundation

struct CommitObject: Codable {
    var sha: String?
    var node_id: String
    var commit: Commit
    var url: String
    var html_url: String
    var comments_url: String
    var author: DetailedUserInfo
    var committer: DetailedUserInfo
    var parents: [ParentsInfo]
    
}

struct Commit: Codable {
    var author: UserInfo
    var committer: UserInfo
    var message: String
    var tree: TreeInfo
    var url: String
    var comment_count: Int
    var verification: VerificationInfo
}

struct UserInfo: Codable {
    var name: String
    var email: String
    var date: String
}

struct TreeInfo: Codable {
    var sha: String
    var url: String
}

struct VerificationInfo: Codable {
    var verified: Bool
    var reason: String
    var signature: String?
    var payload: String?
}

struct DetailedUserInfo: Codable {
    var login: String
    var id: Int
    var node_id: String
    var avatar_url: String
    var gravatar_id: String
    var url: String
    var html_url: String
    var followers_url: String
    var following_url: String
    var gists_url: String
    var starred_url: String
    var subscriptions_url: String
    var organizations_url: String
    var repos_url: String
    var events_url: String
    var received_events_url: String
    var type: String
    var site_admin: Bool
}

struct ParentsInfo: Codable {
    var sha: String
    var url: String
    var html_url: String
}
