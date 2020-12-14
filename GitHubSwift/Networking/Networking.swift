//
//  Networking.swift
//  GitHubSwift
//
//  Created by Matthew Foster on 14/12/20.
//

import Foundation


struct Networking {

    func performNetworkTask<T: Codable>(endpoint: GitHubApi, type: T.Type, completion: ((_ response: [T]) -> Void)?) {
        let urlString = endpoint.baseURL.appendingPathComponent(endpoint.path).absoluteString.removingPercentEncoding
        guard let urlRequest = URL(string: urlString ?? "") else { return }

        let urlSession = URLSession.shared.dataTask(with: urlRequest) { (data, urlResponse, error) in
            if let _ = error {
                return
            }
            guard let data = data else {
                return
            }
            let response = Response(data: data)
            guard let decoded = response.decode(type) else {
                return
            }
            completion?(decoded)
        }
        urlSession.resume()
    }
    
}
