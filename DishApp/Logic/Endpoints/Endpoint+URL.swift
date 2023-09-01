//
//  Endpoint+URL.swift
//  DishApp
//
//  Created by MacBook Air on 31.08.2023.
//

import Foundation

extension Endpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "run.mocky.io"
        components.path = "/v3/" + path
        
        guard let url = components.url else {
            fatalError("Error")
        }
        return url
    }
}
