//
//  BasketView.swift
//  DishApp
//
//  Created by MacBook Air on 31.08.2023.
//

import SwiftUI

struct BasketView: View {
    
    @ObservedObject var basketViewModel: BasketViewModel
    @State private var isHidden = true

    var body: some View {
        NavigationStack {
            InformationView()
                .padding([.top, .trailing])
        
            ScrollView {
                if basketViewModel.products.count > BasketViewConstants.startPoint {
                    
                    ForEach(basketViewModel.products, id: \.self) { product in
                        ProductInBasketView(basketViewModel: basketViewModel, dish: product)
                    }
                    
                } else {
                    VStack() {
                        Spacer(minLength: BasketViewConstants.minLength)
                        Text(BasketViewConstants.basketIsEmptyText)
                    }
                }
            }
            if basketViewModel.products.count > BasketViewConstants.startPoint {
                buyButton
            }
        }
    }
}

extension BasketView {
    var buyButton: some View {
            Button {
            } label: {
                Text("Оплатить \( String(basketViewModel.total)) ₽")
                    .font(.system(size: BasketViewConstants.payButtonFontSize, weight: .medium))
            }
            .frame(width: BasketViewConstants.payButtonWidth, height: BasketViewConstants.payButtonHeight)
            .background(Color.theme.blueColor)
            .foregroundColor(Color(.white))
            .cornerRadius(BasketViewConstants.radius)
            .padding(.bottom, BasketViewConstants.paddingBottom)
        }
    }
