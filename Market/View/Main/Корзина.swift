//
//  CardView.swift
//  Market
//
//  Created by Вероника Гера on 08.07.2023.
//

import SwiftUI
import RealmSwift
import NukeUI

struct CardView: View {
    
    @ObservedResults(CardRealm.self) var cardRealm
    @State var count : Int = 0
    @State var cost: Int = 0
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                ScrollView {
                    ForEach(cardRealm, id: \.id) { item in
                        HStack(spacing: 80) {
                            HStack(alignment: .center, spacing: 8) {
                                HStack(alignment: .center, spacing: 0) {
                                    LazyImage(url: URL(string: item.image)) { state in
                                        if let image = state.image {
                                            image.resizable().aspectRatio(contentMode: .fit)
                                        }
                                    }
                                }.onAppear {
                                    cost = ViewModel.calculateCost(cost: cost, addCost: item.cost, count: item.count, plusCount: nil, minusCount: nil)
                                }
                                .padding(.leading, 9.66971)
                                .padding(.trailing, 3.98166)
                                .padding(.top, 7.39448)
                                .padding(.bottom, 1.70644)
                                .frame(width: 62, height: 62, alignment: .center)
                                .background(Color(red: 0.97, green: 0.97, blue: 0.96))
                                .cornerRadius(6)
                                
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(item.name)
                                        .font(Font.custom("SF Pro Display", size: 14))
                                        .kerning(0.14)
                                        .foregroundColor(.black)
                                    
                                    Text("\(item.cost)₽ · \(item.gramm)г")
                                        .font(Font.custom("SF Pro Display", size: 14))
                                        .kerning(0.14)
                                        .foregroundColor(.black)
                                }
                                .padding(0)
                            }
                            .padding(0)
                            
                            
                            HStack(alignment: .center, spacing: 16) {
                                Button(action: {
                                    ViewModel.task.countMinus(id: item.id, count: 1)
                                    ViewModel.task.count()
                                    cost = ViewModel.calculateCost(cost: cost, addCost: item.cost, count: item.count, plusCount: nil, minusCount: 1)
                                }, label: {
                                    Image("CountMinus")
                                        .frame(width: 24, height: 24)
                                })
                                
                                Text("\(item.count)")
                                    .font(Font.custom("SF Pro Display", size: 14).weight(.medium))
                                    .kerning(0.14)
                                    .foregroundColor(.black)
                                    
                                
                                Button(action: {
                                    ViewModel.task.countPlus(count: 1, id: item.id)
                                    ViewModel.task.count()
                                    cost = ViewModel.calculateCost(cost: cost, addCost: item.cost, count: item.count, plusCount: 1, minusCount: nil)
                                }, label: {
                                    Image("CountPlus")
                                        .frame(width: 24, height: 24)
                                })
                            }
                            .frame(width: 99, height: 32)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 4)
                            .background(Color(red: 0.94, green: 0.93, blue: 0.93))
                            .cornerRadius(10)
                            
                            
                            
                        }.frame(width: 343, height: 62, alignment: .leading)
                    }
                    Spacer(minLength: 16)
                }
                
                HStack(alignment: .center, spacing: 0) {
                    HStack(alignment: .center, spacing: 0) {
                        Text("Оплатить \(cost) ₽")
                        .font(Font.custom("SF Pro Display", size: 16).weight(.medium))
                        .kerning(0.1)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                    }
                    
                    .frame(width: 343, height: 48, alignment: .center)
                }
                .padding(0)
                .frame(width: 343, height: 48, alignment: .center)
                .background(Color(red: 0.2, green: 0.39, blue: 0.88))
                .cornerRadius(10)
                
                
                
            }.navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: Navigation(categoryToggle: true), trailing: Image("фото"))
                .padding(.top, 16)
                
        }
    }
}

#Preview {
    CardView()
}
