//
//  DishesListView.swift
//  DishApp
//
//  Created by MacBook Air on 31.08.2023.
//

import SwiftUI

struct DishesListView: View {
    
    @StateObject private var viewModel: DishesListViewModel = .init()
    @ObservedObject var basketViewModel: BasketViewModel

    @State var dish: Dish? = nil
    @State var showPopOver: Bool = false
    @State var isSelected: Bool = false
    @State var filterArrayResult: [Dish] = []
    @State var selectedTag: Teg? = nil
    
    private let name: String
    let columns = [GridItem(.adaptive(minimum: DishListViewConstants.minimum))]
    let navigationTitle = CategoryResult(сategories: [])
    
    init(name: String, basketViewModel: BasketViewModel) {
        self.name = name
        self.basketViewModel = basketViewModel
        let appearance = UINavigationBarAppearance()
        appearance.shadowColor = .systemBackground
        appearance.backgroundColor = .systemBackground
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
      
    var body: some View {
        filter
        categories
    }
}

extension DishesListView {
    var filter: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: DishListViewConstants.spacing) {
                ForEach(viewModel.tags) { tag in
                    
                    RoundedRectangle(cornerRadius: DishListViewConstants.radius)
                        .frame(width: DishListViewConstants.rectangleWidth, height: DishListViewConstants.rectangleHeight)
                        .foregroundColor(selectedTag == tag ? Color.theme.blueColor : Color.theme.background)
                    
                    
                        .overlay {
                            Button {
                                isSelected = true
                                selectedTag = tag
                                withAnimation(.easeIn(duration: 0.25)) {
                                    filterArrayResult = viewModel.filterDishes(tag: tag)
                                }
                               
                            } label: {
                                Text(tag.rawValue)
                                    .font(.system(size: DishListViewConstants.tagFontSize, weight: .regular))
                                    .foregroundColor(selectedTag == tag ? Color.white : Color.black)
                            }
                        }
                        .padding([.bottom, .top])
                }
            }
            .padding([.leading, .trailing])
        }
    }
    
    var categories: some View {
        ZStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: DishListViewConstants.lazyGridSpacing) {
                    ForEach(isSelected ? filterArrayResult : viewModel.dishes.dishes) { element in
                       
                        VStack(alignment: .leading) {
                            ZStack {
                                RoundedRectangle(cornerRadius: DishListViewConstants.rectangleRadius)
                                    .frame(width: DishListViewConstants.rectangleSize, height: DishListViewConstants.rectangleSize)
                                    .foregroundColor(Color.theme.background)
                                
                                ImageLoadingView(urlString: element.imageURL, sizeWidth: DishListViewConstants.categoryImageSize, sizeHeight: DishListViewConstants.categoryImageSize)
                                    .onTapGesture {
                                        withAnimation(.easeInOut) {
                                            self.dish = element
                                            showPopOver.toggle()
                                        }
                                    }
                            }
                            VStack {
                                Text("\(element.name)")
                                    .lineLimit(2)
                                    .font(.system(size: DishListViewConstants.fontSize))
                                Spacer()
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
            
            .navigationBarBackButtonHidden(true)
            .navigationTitle(name)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    BackButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(DishListViewConstants.userImage)
                        .resizable()
                        .frame(width: DishListViewConstants.imageSize, height: DishListViewConstants.imageSize)
                        .clipShape(Circle())
                }
            }
            ProductDescriptionView(basketViewModel: basketViewModel, showPopOver: $showPopOver, dish: dish ?? Dish.mockProduct)
                .offset(y: showPopOver ? 0 : 600)
        }
    }
}
