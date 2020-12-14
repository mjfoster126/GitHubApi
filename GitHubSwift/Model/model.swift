//
//  model.swift
//  GitHubSwift
//
//  Created by Matthew Foster on 13/12/20.
//

import Foundation

struct CommitObject {
    var sha: String
    var nodeId: String
    var commit: Commit
    var url: String
    var comments_url: String
    var author: UserInfo
    var commitier: UserInfo
    var parents: ParentsInfo
}

struct Commit {
    var author: SmallUserInfo
    var committer: SmallUserInfo
    var message: String
    var tree: TreeInfo
    var url: String
    var comment_count: Int
    var varification: VerificationInfo
}

struct SmallUserInfo {
    var name: String
    var email: String
    var date: String
}

struct TreeInfo {
    var sha: String
    var url: String
}

struct VerificationInfo {
    var verified: Bool
    var reason: String
    var signature: String
    var payload: String
}

struct UserInfo {
    var login: String
    var id: String
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
    var recieved_events_url: String
    var type: String
    var site_admin: String
}

struct ParentsInfo {
    var sha: String
    var url: String
    var html_url: String
}
