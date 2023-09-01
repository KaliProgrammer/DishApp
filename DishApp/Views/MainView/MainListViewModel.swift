//
//  MainListViewModel.swift
//  DishApp
//
//  Created by MacBook Air on 31.08.2023.
//

import Foundation
import Combine

class MainListViewModel: ObservableObject {
    
    @Published var categories: CategoryResult = CategoryResult(сategories: [])
    
    private var cancellables = Set<AnyCancellable>()
    
    let apiService = CategoryService()
    
    init() {
        fetch()
    }
    
    func fetch() {
        fetchCategories()
    }
    
    func fetchCategories() {
        apiService.getCategories()
            .receive(on: DispatchQueue.main)
            .sink { completion  in
                switch completion {
                case .failure(_):
                    print(ApiError.badURL)
                case .finished:
                    break
                }
            } receiveValue: { [weak self] categories in
                self?.categories = categories
            }
            .store(in: &cancellables)
    }
}
