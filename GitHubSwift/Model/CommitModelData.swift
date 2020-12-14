//
//  CommitModelView.swift
//  GitHubSwift
//
//  Created by Matthew Foster on 14/12/20.
//

import Foundation

class CommitModelData {

    private let networking = Networking()
    private var commits: [CommitObject]?

    public func getCommits(user: String, repo: String, completion: (() -> Void)?) {
        
        networking.performNetworkTask(endpoint: GitHubApi.commits(user: user,repo:repo),
                                      type: CommitObject.self) { [weak self] (response) in
                                            self?.commits = response
                                            completion?()
        }
    }

    public func commitRow(index: Int) -> CommitObject? {
        guard let commits = commits else { return nil }
        return commits[index]
    }
    
    public var count: Int {
        return commits?.count ?? 0
    }


}
