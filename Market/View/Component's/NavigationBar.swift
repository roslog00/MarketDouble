//
//  NavigationBar.swift
//  Market
//
//  Created by Вероника Гера on 08.07.2023.
//

import SwiftUI

struct Navigation: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var categoryToggle = true
    
    var btnBack : some View {
        Button(action: {
            withAnimation {
                self.presentationMode.wrappedValue.dismiss()
            }
        }) {
            HStack {
                Image("vector-3")
            }
        }
    }
    
    var body: some View {
        if categoryToggle {
            HStack {
                Image("Icons")
                    .frame(width: 24, height: 24)
                VStack(alignment: .leading, spacing: 4) {
                    Text("Санкт-Петербург")
                        .font(Font.custom("SF Pro Display", size: 18).weight(.medium))
                        .foregroundColor(.black)
                    
                    Text("12 Августа, 2023")
                        .font(Font.custom("SF Pro Display", size: 14))
                        .kerning(0.14)
                        .foregroundColor(.black.opacity(0.5))
                }
            }
        } else {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image("vector-3")
                }
            }
        }
    }
}

#Preview {
    Navigation()
}
