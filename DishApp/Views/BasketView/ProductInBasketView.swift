//
//  ProductInBasketView.swift
//  DishApp
//
//  Created by MacBook Air on 31.08.2023.
//

import SwiftUI

struct ProductInBasketView: View {
  
    @ObservedObject var basketViewModel: BasketViewModel
    @State var itemCounter: Int = ProductInBasketViewConstants.itemCounter
    
    let dish: Dish
  
    var body: some View {
            HStack {
                RoundedRectangle(cornerRadius: ProductInBasketViewConstants.hStackRadius)
                    .frame(width: ProductInBasketViewConstants.hStackSize,
                           height: ProductInBasketViewConstants.hStackSize)
                    .foregroundColor(Color.theme.background)
                    .overlay {
                        ImageLoadingView(urlString: dish.imageURL,
                                         sizeWidth: ProductInBasketViewConstants.imageWidth,
                                         sizeHeight: ProductInBasketViewConstants.imageHeight)
                    }
                    .padding(.leading)
                
                productDetails
                
                Spacer()
                
                counter
            }
    }
}

extension ProductInBasketView {
    var counter: some View {
        ZStack {
            RoundedRectangle(cornerRadius: ProductInBasketViewConstants.counterRadius)
                .foregroundColor(Color.theme.counterColor)
                .frame(width: ProductInBasketViewConstants.counterWidth,
                       height: ProductInBasketViewConstants.counterHeight)
            
            HStack {
                Button {
                    if itemCounter == ProductInBasketViewConstants.itemCounter {
                        basketViewModel.removeFromBasket(product: dish)
                    }
                   else if itemCounter > ProductInBasketViewConstants.itemCounter {
                        itemCounter -= ProductInBasketViewConstants.itemCounter
                       basketViewModel.decrease(product: dish)
                    }
                    
                } label: {
                    Image(ProductInBasketViewConstants.minusImage)
                        .resizable()
                        .frame(width: ProductInBasketViewConstants.minusPlusSize,
                               height: ProductInBasketViewConstants.minusPlusSize)
                }
                .padding(.leading, ProductInBasketViewConstants.padding)
                
                Text("\(itemCounter)")
                    .foregroundColor(.black)
                    .font(.system(size: ProductInBasketViewConstants.fontSize,
                                  weight: .semibold))
                    .frame(width: ProductInBasketViewConstants.itemCounterWidth,
                           height: ProductInBasketViewConstants.itemCounterHeeight)
                Button {
                    itemCounter += ProductInBasketViewConstants.itemCounter
                    basketViewModel.increase(product: dish)
                } label: {
                    Image(ProductInBasketViewConstants.plusImage)
                        .resizable()
                        .frame(width: ProductInBasketViewConstants.minusPlusSize,
                               height: ProductInBasketViewConstants.minusPlusSize)
                }
                .padding(.trailing, ProductInBasketViewConstants.padding)
            }
            .frame(width: ProductInBasketViewConstants.counterFrameWidth)
        }
    }
    
    var productDetails: some View {
        VStack(alignment: .leading) {
            Text(dish.name)
                .font(.system(size: ProductInBasketViewConstants.fontSize))

            HStack {
                Text("\(dish.price) ₽")
                    .font(.system(size: ProductInBasketViewConstants.fontSize))
                
                Text("• \(dish.weight)г")
                    .font(.system(size: ProductInBasketViewConstants.fontSize))
                    .foregroundColor(Color.theme.grayColor)
            }
        }
    }
}
