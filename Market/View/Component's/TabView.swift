//
//  TabView.swift
//  Market
//
//  Created by Вероника Гера on 08.07.2023.
//

import SwiftUI

struct TabBarView: View {
    
    @State var mainToggle = true
    @State var searchToggle = false
    @State var cardToggle = false
    @State var accautnToggle = false
    
    init() {
        UITabBar.appearance().barTintColor = UIColor.white
        UITabBar.appearance().tintColor = .white
    }
    
    var body: some View {
        TabView {
            
            Scroll()
                .tabItem {
                    VStack(alignment: .center, spacing: 3) {
                        Text("Главная")
                            .font(
                                Font.custom("SF Pro Display", size: 10)
                                    .weight(.medium)
                            )
                            .kerning(0.1)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.2, green: 0.39, blue: 0.88))
                        
                        if mainToggle {
                            Image("главная")
                                .frame(width: 28, height: 28)
                        } else {
                            Image("HomeOff")
                                .frame(width: 28, height: 28)
                        }
                        
                    }
                    .padding(.leading, 6)
                    .padding(.trailing, 5)
                    .padding(.top, 5)
                    .padding(.bottom, 2)
                    .background(.white)
                }
                .onAppear {
                    searchToggle = false
                    mainToggle = true
                    cardToggle = false
                    accautnToggle = false
                }
            
            
            
            Text("Поиск")
                .tabItem {
                    VStack(alignment: .center, spacing: 5) {
                        Text("Поиск")
                            .font(
                                Font.custom("SF Pro Display", size: 10)
                                    .weight(.medium)
                            )
                            .kerning(0.1)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.7))
                        
                        if searchToggle {
                            Image("SearchOn")
                                .frame(width: 24, height: 24)
                        } else {
                            Image("поиск")
                                .frame(width: 24, height: 24)
                        }
                    }
                    .padding(.horizontal, 9)
                    .padding(.top, 7)
                    .padding(.bottom, 2)
                    .background(.white)
                }.onAppear {
                    searchToggle = true
                    mainToggle = false
                    cardToggle = false
                    accautnToggle = false
                }
            
            
            
            CardView()
                .tabItem {
                    VStack(alignment: .center, spacing: 3) {
                        Text("Корзина")
                            .font(
                                Font.custom("SF Pro Display", size: 10)
                                    .weight(.medium)
                            )
                            .kerning(0.1)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.7))
                        
                        if cardToggle {
                            Image("CardOn")
                                .frame(width: 28, height: 28)
                        } else {
                            Image("корзина")
                                .frame(width: 28, height: 28)
                        }
                    }
                    .padding(.horizontal, 4)
                    .padding(.top, 5)
                    .padding(.bottom, 2)
                    .background(.white)
                }.onAppear {
                    searchToggle = false
                    mainToggle = false
                    cardToggle = true
                    accautnToggle = false
                }
            
            
            
            Text("Аккаунт")
                .tabItem {
                    VStack(alignment: .center, spacing: 3) {
                        Text("Аккаунт")
                            .font(
                                Font.custom("SF Pro Display", size: 10)
                                    .weight(.medium)
                            )
                            .kerning(0.1)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.65, green: 0.66, blue: 0.7))
                        
                        if accautnToggle {
                            Image("AccauntOn")
                                .frame(width: 28, height: 28)
                        } else {
                            Image("аккаунт")
                                .frame(width: 28, height: 28)
                        }
                    }
                    .padding(.horizontal, 5)
                    .padding(.top, 5)
                    .padding(.bottom, 2)
                    .background(.white)
                    
                }.onAppear {
                    searchToggle = false
                    mainToggle = false
                    cardToggle = false
                    accautnToggle = true
                }
            
            
        }
    }
}


#Preview {
    TabBarView()
}
