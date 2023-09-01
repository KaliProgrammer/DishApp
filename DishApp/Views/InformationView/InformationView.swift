//
//  InformationView.swift
//  DishApp
//
//  Created by MacBook Air on 31.08.2023.
//

import SwiftUI

struct InformationView: View {
    
    var body: some View {
        infoView
        .padding(.leading)
    }
}
extension InformationView {
    var infoView: some View {
        HStack {
            Image(InformationViewConstants.locationImage)
                .resizable()
                .frame(width: InformationViewConstants.locationImageSize,
                       height: InformationViewConstants.locationImageSize,
                       alignment: .leading)
                .padding(.bottom)
            VStack(alignment: .leading) {
                Text(InformationViewConstants.locationText)
                Text(Date.now.formatted(date: .long,
                                        time: .omitted))
                    .foregroundColor(Color(white: 0.5))
            }
            Spacer()
            Image(InformationViewConstants.userImage)
                .resizable()
                .frame(width: InformationViewConstants.userImageSize,
                       height: InformationViewConstants.userImageSize)
                .clipShape(Circle())
        }
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView()
    }
}
