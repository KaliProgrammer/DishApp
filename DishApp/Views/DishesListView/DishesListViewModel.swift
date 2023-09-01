//
//  DishesListViewModel.swift
//  DishApp
//
//  Created by MacBook Air on 31.08.2023.
//

import Foundation
import Combine

class DishesListViewModel: ObservableObject {
    
    @Published var dishes: DishesResult = DishesResult(dishes: [])
    @Published var tags = Teg.allCases
    
    private var cancellables = Set<AnyCancellable>()
    
    let apiService = DishService()
    
    init() {
        fetch()
    }
    
    func fetch() {
        fetchDishes()
    }
    
    func fetchDishes() {
        apiService.getDishes()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(_):
                    print(ApiError.badURL)
                case .finished:
                    break
                }
            } receiveValue: { [weak self] dishes in
                self?.dishes = dishes
            }
            .store(in: &cancellables)
    }
    
    func filterDishes(tag: Teg) -> [Dish] {
       return self.dishes.dishes.filter { $0.tegs.contains(tag) }
    }
}
