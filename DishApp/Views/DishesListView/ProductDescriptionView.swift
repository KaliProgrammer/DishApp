//
//  ProductDescriptionView.swift
//  DishApp
//
//  Created by MacBook Air on 31.08.2023.
//

import SwiftUI

struct ProductDescriptionView: View {
    
    @ObservedObject var basketViewModel: BasketViewModel
    
    @Binding var showPopOver: Bool
    
    let dish: Dish
   
    var body: some View {
        ZStack {
            VStack {
                Spacer(minLength: ProductDescriptionViewConstants.spacer)
                ZStack {
                    RoundedRectangle(cornerRadius: ProductDescriptionViewConstants.spacer)
                        .foregroundColor(Color.theme.background)
                        .frame(width: ProductDescriptionViewConstants.rectangleWidth,
                               height: ProductDescriptionViewConstants.rectangleHeight)
                    Spacer(minLength: ProductDescriptionViewConstants.spacerMin)
                    
                    ImageLoadingView(
                        urlString: dish.imageURL,
                        sizeWidth: ProductDescriptionViewConstants.imageWidth,
                        sizeHeight: ProductDescriptionViewConstants.imageHeight
                    )
                        .offset(x: ProductDescriptionViewConstants.imageX, y: ProductDescriptionViewConstants.imageY)
                   
                    likeAndCloseButton
                        .offset(x: ProductDescriptionViewConstants.likeAndCloseButtonX, y: ProductDescriptionViewConstants.likeAndCloseButtonY)
                    
                }
               
                productCard
                .padding(.leading)
        }
    }
        .frame(
            width: ProductDescriptionViewConstants.zStackWidth,
            height: ProductDescriptionViewConstants.zStackHeight
        )
        .background(Color.white)
        .cornerRadius(ProductDescriptionViewConstants.zStackRadius)
        .shadow(
            color: Color.black.opacity(ProductDescriptionViewConstants.zStackOpacity),
            radius: ProductDescriptionViewConstants.shadowRadius,
            x: ProductDescriptionViewConstants.shadowX,
            y: ProductDescriptionViewConstants.shadowY
        )
    }
}

extension ProductDescriptionView {
    var likeAndCloseButton: some View {
        HStack {
            RoundedRectangle(cornerRadius: ProductDescriptionViewConstants.likeAndCloseButtonRadius)
                .frame(
                    width: ProductDescriptionViewConstants.likeAndCloseButtonSize,
                    height: ProductDescriptionViewConstants.likeAndCloseButtonSize
                )
                .foregroundColor(Color(.white))
                .overlay(alignment: .center) {
                    Button {
                        
                    } label: {
                        Image(ProductDescriptionViewConstants.imageLike)
                    }
                }
            
            RoundedRectangle(cornerRadius: ProductDescriptionViewConstants.likeAndCloseButtonRadius)
                .frame(
                    width: ProductDescriptionViewConstants.likeAndCloseButtonSize,
                    height: ProductDescriptionViewConstants.likeAndCloseButtonSize
                )
                .foregroundColor(Color(.white))
                .overlay(alignment: .center) {
                    Button {
                        withAnimation {
                            showPopOver = false
                        }
                    } label: {
                        Image(ProductDescriptionViewConstants.imageClose)
                    }
                }
        }

    }
    
    var productCard: some View {
        VStack(alignment: .leading,
               spacing: ProductDescriptionViewConstants.productCardSpacing) {
            Text(dish.name)
                .font(.system(size: ProductDescriptionViewConstants.productCardSize,
                              weight: .medium))

        HStack {
            Text("\(dish.price) ₽")
                .font(.system(size: ProductDescriptionViewConstants.productCardSize))

            Text("• \(dish.weight)г")
                .font(.system(size: ProductDescriptionViewConstants.productCardSize))
                .foregroundColor(Color.theme.grayColor)
        }
        .padding(.bottom, ProductDescriptionViewConstants.productCardPaddingBottom)
            
            Text(dish.description)
                .lineLimit(4)
                .font(.system(size: ProductDescriptionViewConstants.fontSize))
                .padding([.bottom, .trailing])
            
            addToBasketButton
    }

    }
    
    var addToBasketButton: some View {
        Button {
            basketViewModel.addToBasket(product: dish)
        } label: {
            Text(ProductDescriptionViewConstants.addButtonText)
                .font(.system(size: ProductDescriptionViewConstants.productCardSize, weight: .medium))
        }
        .frame(width: ProductDescriptionViewConstants.addButtonWidth, height: ProductDescriptionViewConstants.addButtonHeight)
        .background(Color.theme.blueColor)
        .foregroundColor(Color(.white))
        .cornerRadius(ProductDescriptionViewConstants.addButtonRadius)
        .padding(.bottom, ProductDescriptionViewConstants.addButtonPaddingBottom)
    }
}
