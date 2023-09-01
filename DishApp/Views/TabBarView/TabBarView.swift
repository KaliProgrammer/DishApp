//
//  TabBarView.swift
//  DishApp
//
//  Created by MacBook Air on 31.08.2023.
//

import SwiftUI

struct TabBarView: View {
    
    @ObservedObject var basketViewModel: BasketViewModel
    
    var body: some View {
        tabElements
            .onAppear {
                let tabBarAppearance = UITabBarAppearance()
                tabBarAppearance.configureWithOpaqueBackground()
                UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
                
                let navigationBarAppearance = UINavigationBarAppearance()
                navigationBarAppearance.configureWithOpaqueBackground()
                UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
            }
    }
}

extension TabBarView {
    var tabElements: some View {
        TabView {
            MainView(basketViewModel: basketViewModel)
                .tabItem {
                    VStack {
                        Image(TabBar.homeImage)
                            .renderingMode(.template)
                        Text(TabBar.homeText)
                    }
                }
            
            Text(TabBar.searchText)
                .tabItem {
                    VStack {
                        Image(TabBar.searchImage)
                            .renderingMode(.template)
                        Text(TabBar.searchText)
                    }
                }
            
            BasketView(basketViewModel: basketViewModel)
                .tabItem {
                    VStack {
                        Image(TabBar.bagImage)
                            .renderingMode(.template)
                        Text(TabBar.bagText)
                    }
                }
            
            Text(TabBar.accountText)
                .tabItem {
                    VStack {
                        Image(TabBar.accountImage)
                            .renderingMode(.template)
                        Text(TabBar.accountText)
                }
            }
        }
    }
}
