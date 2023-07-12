//
//  PopUp.swift
//  Market
//
//  Created by Вероника Гера on 09.07.2023.
//

import SwiftUI
import NukeUI


struct PopUp: View {
    
    @ObservedObject var realmManager = RealmManager()
    @Environment(\.sizeCategory) var sizeCategory
    @Binding var togglePopUp : Bool
    @Binding var description: String
    @Binding var imageUrl: String
    @Binding var name: String
    @Binding var gramm: Int
    @Binding var cost: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: sizeCategory == .large ? 11 : 10) {
            ZStack{
//                AsyncImage(url: URL(string: imageUrl)!, scale: 4).frame(alignment: .center)
                LazyImage(url: URL(string: imageUrl)!) { state in
                    if let image = state.image {
                        image.resizable().aspectRatio(contentMode: .fit)
                    }
                }

                HStack {
                    Image("Icons 1")
                        .frame(width: 24, height: 24)
                        .padding(10)
                        .frame(width: 40, height: 40, alignment: .center)
                        .background(.white)
                        .cornerRadius(8)
                    Button(action: {
                            $togglePopUp.wrappedValue = false
                    }, label: {
                        Image("dismiss_24")
                            .frame(width: 24, height: 24)
                            .padding(10)
                            .frame(width: 40, height: 40, alignment: .center)
                            .background(.white)
                            .cornerRadius(8)
                    })
                }.offset(x: 105, y: -85)
            }.frame(width: 311, height: 232, alignment: .center)
            .background(Color(red: 0.97, green: 0.97, blue: 0.96))
            .cornerRadius(10)
            
            Text(name)
                .font(Font.custom("SF Pro Display", size: 16).weight(.medium))
                .kerning(0.16)
                .foregroundColor(.black)
            
            Text("\(cost) · \(gramm)")
                .font(Font.custom("SF Pro Display", size: 14))
                .kerning(0.14)
                .foregroundColor(.black)
            
            Text(description)
              .font(Font.custom("SF Pro Display", size: 14))
              .kerning(0.14)
              .foregroundColor(.black.opacity(0.65))
              .frame(width: 311, alignment: .leading)
            
            Button(action: {
                realmManager.addDataToCard(nameOfItem: name, weightOfItem: gramm, costOfItem: cost, imageUrlOfItem: imageUrl)
            }, label: {
                withAnimation {
                    HStack(alignment: .center, spacing: 0) {
                        Text("Добавить в корзину")
                           .font(Font.custom("SF Pro Display", size: 16).weight(.medium))
                           .kerning(0.1)
                           .multilineTextAlignment(.center)
                           .foregroundColor(.white)
                    }
                    .padding(0)
                    .frame(width: 311, height: 48, alignment: .center)
                    .background(Color(red: 0.2, green: 0.39, blue: 0.88))
                    .cornerRadius(10)
                }
            })
            
            
        }
        .frame(width: 343, height: sizeCategory == .large ? 500 : 100)
        .background(.white)
        .cornerRadius(15)
    }
}

#Preview {
    PopUp(togglePopUp: Category(categoryToggle: Navigation().$categoryToggle).$togglePopUp, description: Category(categoryToggle: Navigation().$categoryToggle).$description, imageUrl: Category(categoryToggle: Navigation().$categoryToggle).$imageUrl, name: Category(categoryToggle: Navigation().$categoryToggle).$name, gramm: Category(categoryToggle: Navigation().$categoryToggle).$gramm, cost: Category(categoryToggle: Navigation().$categoryToggle).$cost)
}
