//
//  DishAppApp.swift
//  DishApp
//
//  Created by MacBook Air on 31.08.2023.
//

import SwiftUI

@main
struct DishAppApp: App {
    @StateObject private var basketViewModel: BasketViewModel = .init()

    var body: some Scene {
        WindowGroup {
            TabBarView(basketViewModel: basketViewModel)
        }
    }
}
