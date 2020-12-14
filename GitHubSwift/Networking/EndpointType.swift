//
//  EndpointType.swift
//  GitHubSwift
//
//  Created by Matthew Foster on 14/12/20.
//

import Foundation

protocol EndpointType {

    var baseURL: URL { get }

    var path: String { get }

}
