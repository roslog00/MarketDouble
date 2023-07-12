//
//  CounterForCard.swift
//  Market
//
//  Created by Вероника Гера on 10.07.2023.
//

import SwiftUI

//struct CounterForCard: View {
//    
//    @ObservedObject var realmManager = RealmManager()
//    @Binding var count: Int
//    
//    var body: some View {
//        HStack(alignment: .center, spacing: 16) {
//            Button(action: {
//                realmManager.countMinus(id: 0, count: 0)
//            }, label: {
//                Image("CountMinus")
//                .frame(width: 24, height: 24)
//            })
//            
//            Text("\(count)")
//            .font(Font.custom("SF Pro Display", size: 14).weight(.medium))
//            .kerning(0.14)
//            .foregroundColor(.black)
//            
//            Button(action: {
//                
//            }, label: {
//                Image("CountPlus")
//                    .frame(width: 24, height: 24)
//            })
//        }
//        .padding(.horizontal, 6)
//        .padding(.vertical, 4)
//        .background(Color(red: 0.94, green: 0.93, blue: 0.93))
//        .cornerRadius(10)
//        
//    }
//}
//
//#Preview {
//    CounterForCard(count: CardView().$count)
//}
