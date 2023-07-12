//
//  Card.swift
//  Market
//
//  Created by Вероника Гера on 08.07.2023.
//

import SwiftUI
import NukeUI

struct Card: View {
    
    @State var preview : String?
    @State var urlImage : String?
 
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack(alignment: .center, spacing: 0) {
//                AsyncImage(url: URL(string: urlImage!), scale: 9)
                LazyImage(url: URL(string: urlImage!)) { state in
                    if let image = state.image {
                        image.resizable().aspectRatio(contentMode: .fit)
                    }
                }
                
            }
            .frame(width: 79, height: 79)
            .padding(.leading, 17)
            .padding(.trailing, 13)
            .padding(.top, 14)
            .padding(.bottom, 7)
            .background(Color(red: 0.97, green: 0.97, blue: 0.96))
            .cornerRadius(10)
            
            Text(preview!)
            .multilineTextAlignment(.leading)
            .fixedSize(horizontal: false, vertical: true)
            .lineLimit(2)
            .font(Font.custom("SF Pro Display", size: 13))
            .kerning(0.14)
            .foregroundColor(.black)
            .frame(height: 30)
        }
        .padding(0)
    }
}

#Preview {
    Card()
}
