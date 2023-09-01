//
//  ImageLoadingView.swift
//  AlyonaK(testApp)
//
//  Created by MacBook Air on 28.06.2023.
//

import SwiftUI

struct ImageLoadingView: View {
    
    let urlString: String
    let sizeWidth: CGFloat
    let sizeHeight: CGFloat
    
    var body: some View {
        AsyncImage(url: URL(string: urlString)) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .failure(_):
                Color.gray
                    .frame(width: sizeWidth, height: sizeHeight)
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
            @unknown default:
                EmptyView()
            }
        }
        .frame(width: sizeWidth, height: sizeHeight)
    }
}
