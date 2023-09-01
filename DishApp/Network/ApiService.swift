//
//  ApiService.swift
//  DishApp
//
//  Created by MacBook Air on 31.08.2023.
//

import Foundation
import Combine

protocol Service {
    func fetch<T: Decodable>(type: T.Type, url: URL) -> AnyPublisher<T, Error>
}

class ApiService: Service {
    
    func fetch<T: Decodable>(type: T.Type, url: URL) -> AnyPublisher<T, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
