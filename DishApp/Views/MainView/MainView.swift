//
//  MainView.swift
//  DishApp
//
//  Created by MacBook Air on 31.08.2023.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel: MainListViewModel = .init()
    @ObservedObject var basketViewModel: BasketViewModel
    
    var body: some View {
        
        NavigationStack {
            
            InformationView()
                .padding([.top, .trailing])

            categories
            .scrollIndicators(.hidden)
        }
    }
}

extension MainView {
    var categories: some View {
        ScrollView {
            ForEach(viewModel.categories.сategories) { element in
                NavigationLink {
                    DishesListView(name: element.name ?? "", basketViewModel: basketViewModel)
                        .transition(.opacity.animation(.easeInOut))
                        .navigationBarBackButtonHidden(true)
                } label: {
                    ZStack(alignment: .leading) {
                        ImageLoadingView(urlString: element.imageURL ?? "",
                                         sizeWidth: MainViewConstants.imageSizeWidth,
                                         sizeHeight: MainViewConstants.imageSizeHeight)
                        .cornerRadius(MainViewConstants.radius)
                        .padding(.bottom, MainViewConstants.paddingBottom)
                        
                        VStack() {
                            Text(element.name ?? "")
                                .font(.system(size: MainViewConstants.fontSize, weight: .medium))
                            Spacer()
                            
                        }
                        .padding([.leading, .top])
                    }
                }
                .foregroundColor(Color.black)
                .font(.system(size: MainViewConstants.fontSize, weight: .medium))
            }
        }
    }
}
