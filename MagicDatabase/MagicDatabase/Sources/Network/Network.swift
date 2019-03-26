//
//  Network.swift
//  MagicDatabase
//
//  Created by François Juteau on 24/03/2019.
//  Copyright © 2019 Momo. All rights reserved.
//

import Foundation

enum APICredentials {
    static let key = "9f3cdf6f83a5a160c525cd7ce9df4591"
    static let token = "8a5a8cf590e32324d12599504141c826"
    static let securityTokenPath = "/?key=\(key)&token=\(token)"
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

enum BaseURL {
    static let mtg: URL = URL(string: "https://api.magicthegathering.io/")!
}

struct Query {
    let method: HTTPMethod
    let baseURL: URL
    let path: String?
    let queryItems: [String: String?]?
    let parameters: [String: Any]?
    let securityKey: String?
    
    var url: URL {
        let url = URL(string: baseURL.absoluteString + (path ?? ""))
        return url!
    }
}

final class Network {
    func request<T: Codable>(query: Query, completionHandler: @escaping ((T) -> Void)) {
        
        var urlRequest = URLRequest(url: query.url)
        urlRequest.httpMethod = query.method.rawValue
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)

        let task = session.dataTask(with: urlRequest) { (data, response, err) in
            
            guard err == nil else {
                print("error calling GET on /todos/1")
                print(err!)
                return
            }
            // make sure we got data
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            do {
                let dataResponse = try JSONDecoder().decode(T.self, from: responseData)
                completionHandler(dataResponse)
            } catch {
                print("demn son: \(error.localizedDescription)")
                return
            }
        }
        task.resume()
        }
    
}
