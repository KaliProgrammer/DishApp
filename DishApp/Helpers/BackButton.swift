//
//  BackButton.swift
//  AlyonaK(testApp)
//
//  Created by MacBook Air on 29.06.2023.
//

import SwiftUI

struct BackButton: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        Button {
            self.presentationMode.wrappedValue.dismiss()
            
        } label: {
            HStack(spacing: BackButtonConstants.spacing) {
                Image(BackButtonConstants.imageName)
                    .resizable()
                    .frame(width: BackButtonConstants.width, height: BackButtonConstants.height)
            }
            .padding(.leading)
        }
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton()
    }
}
