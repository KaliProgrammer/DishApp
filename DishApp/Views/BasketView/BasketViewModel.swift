//
//  BasketViewModel.swift
//  DishApp
//
//  Created by MacBook Air on 31.08.2023.
//

import Foundation

class BasketViewModel: ObservableObject {
    @Published private(set) var products: [Dish] = []
    @Published private(set) var total: Int = 0
    
    func addToBasket(product: Dish) {
        guard !products.contains(where: {$0.id == product.id }) else {
            return
        }
            products.append(product)
            total += product.price
    }
    
    func removeFromBasket(product: Dish) {
        products = products.filter({ $0.id != product.id })
        total -= product.price
    }
    
    func increase(product: Dish) {
        total += product.price
    }
    
    func decrease(product: Dish) {
        total -= product.price
    }
}
