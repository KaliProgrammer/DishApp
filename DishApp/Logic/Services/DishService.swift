//
//  DishService.swift
//  DishApp
//
//  Created by MacBook Air on 31.08.2023.
//

import Combine

protocol DishData {
    var networkService: Service { get }
    func getDishes() -> AnyPublisher<DishesResult, Error>
}

final class DishService: DishData {
  
    var networkService: Service
    
    init(networkService: Service = ApiService()) {
        self.networkService = networkService
    }
    
    func getDishes() -> AnyPublisher<DishesResult, Error> {
        let endpoint = Endpoint.dishes
        return networkService.fetch(type: DishesResult.self, url: endpoint.url)
    }
}
