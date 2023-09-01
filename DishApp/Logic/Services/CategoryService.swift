//
//  CategoryService.swift
//  DishApp
//
//  Created by MacBook Air on 31.08.2023.
//

import Combine

protocol CategoryData {
    var networkService: Service { get }
    func getCategories() -> AnyPublisher<CategoryResult, Error>
}

final class CategoryService: CategoryData {
    var networkService: Service
    
    init(networkService: Service = ApiService()) {
        self.networkService = networkService
    }
    
    func getCategories() -> AnyPublisher<CategoryResult, Error> {
        let endpoint = Endpoint.categories
        return networkService.fetch(type: CategoryResult.self, url: endpoint.url)
    }
}
