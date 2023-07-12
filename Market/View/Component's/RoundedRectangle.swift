//
//  RoundedRectangle.swift
//  Market
//
//  Created by Вероника Гера on 08.07.2023.
//

//import SwiftUI
//
//struct TegsRoundedRectangle: View {
//    
//    @State var teg: String = "1122"
//    @State var name: String?
//    @State var tegsToggle = false
//    
//    //    var body: some View {
//    //        if tegsToggle {
//    //            HStack(alignment: .top, spacing: 10) {
//    //                Text(name!)
//    //                    .font(Font.custom("SF Pro Display", size: 14))
//    //                    .kerning(0.14)
//    //                    .foregroundColor(.white)
//    //            }
//    //            .onTapGesture {
//    //                withAnimation{
//    //                    tegsToggle.toggle()
//    //                }
//    //            }
//    //            .padding(.horizontal, 16)
//    //            .padding(.vertical, 10)
//    //            .background(Color(red: 0.2, green: 0.39, blue: 0.88))
//    //            .cornerRadius(10)
//    //        } else {
//    //            HStack(alignment: .top, spacing: 10) {
//    //                Text(name!)
//    //                    .font(Font.custom("SF Pro Display", size: 14))
//    //                    .kerning(0.14)
//    //                    .foregroundColor(.black)
//    //            }
//    //            .onTapGesture {
//    //                withAnimation {
//    //                    tegsToggle.toggle()
//    //                    Category(categoryToggle: Navigation().$categoryToggle).tegOfCard = name!
//    //                    print(name!)
//    //                    print(Category(categoryToggle: Navigation().$categoryToggle).tegOfCard)
//    //
//    //                }
//    //            }
//    //            .padding(.horizontal, 16)
//    //            .padding(.vertical, 10)
//    //            .background(Color(red: 0.97, green: 0.97, blue: 0.96))
//    //            .cornerRadius(10)
//    //        }
//    
//    
//    var body: some View {
//        if tegsToggle {
//            Button {
//                tegsToggle.toggle()
//            } label: {
//                HStack(alignment: .top, spacing: 10) {
//                    Text(name!)
//                        .font(Font.custom("SF Pro Display", size: 14))
//                        .kerning(0.14)
//                        .foregroundColor(.white)
//                }
//                .padding(.horizontal, 16)
//                .padding(.vertical, 10)
//                .background(Color(red: 0.2, green: 0.39, blue: 0.88))
//                .cornerRadius(10)
//            }
//            
//        } else {
//            Button {
//                tegsToggle.toggle()
//                teg = name!
//                print(teg)
//                print(Category(categoryToggle: Navigation().$categoryToggle, tegOfCard: TegsRoundedRectangle().$teg).tegOfCard)
//            } label: {
//                HStack(alignment: .top, spacing: 10) {
//                    Text(name!)
//                        .font(Font.custom("SF Pro Display", size: 14))
//                        .kerning(0.14)
//                        .foregroundColor(.black)
//                }
//                .padding(.horizontal, 16)
//                .padding(.vertical, 10)
//                .background(Color(red: 0.97, green: 0.97, blue: 0.96))
//                .cornerRadius(10)
//            }
//        }
//        
//    }
//}
//
//#Preview {
//    TegsRoundedRectangle()
//}
