//
//  Networking.swift
//  GitHubSwift
//
//  Created by Matthew Foster on 14/12/20.
//

import Foundation


struct Networking {
    

    func performNetworkTask<T: Codable>(endpoint: GitHubApi, type: T.Type, completion: ((_ response: [T] ) -> Void)?) {
        let urlString = endpoint.baseURL.appendingPathComponent(endpoint.path).absoluteString.removingPercentEncoding
        guard let urlRequest = URL(string: urlString ?? "") else {
            print("Endpoint URL is not correct")
            return
            
        }

        let urlSession = URLSession.shared.dataTask(with: urlRequest) { (data, urlResponse, error) in
            
            if let response = urlResponse as? HTTPURLResponse {
                print("Status Code: \(response.statusCode)")
            }
            
            if let error = error {
                print(error)
                return
            }
            guard let data = data else {
                print("API call returned no data")
                return
            }
            let response = Response(data: data)
            guard let decoded = response.decode(type) else {
                print("Error in passing json data")
                return
            }
            completion?(decoded)
        }
        urlSession.resume()
    }
    
}
