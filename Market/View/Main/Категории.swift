//
//  Категории.swift
//  Market
//
//  Created by Вероника Гера on 08.07.2023.
//

import SwiftUI


struct Category: View {
    
    @State var colomns = Array(repeating: GridItem(.flexible(minimum: 40, maximum: 115)), count: 3)
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var tegsRaws = Array(repeating: GridItem(.fixed(50)), count: 1)
    @Binding var categoryToggle : Bool
    @State var dishes : [Dishes] = []
    @State var tegs = Tegs.allCases
    @State var togglePopUp = false
    @State var title : String?
    @State var tegOfCard: String = "122"
    @State var tegsToggle: Bool = false
    
    @State var description: String = ""
    @State var imageUrl: String = ""
    @State var name: String = ""
    @State var gramm: Int = 0
    @State var cost: Int = 0
    
    
    var body: some View {
        ZStack {
            VStack(spacing: -570) {
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: tegsRaws) {
                        ForEach(tegs, id: \.self) { teg in
                            //                            TegsRoundedRectangle(name: teg.rawValue)
                            if tegsToggle && teg.rawValue == tegOfCard{
                                Button {
                                    withAnimation {
                                        tegsToggle.toggle()
                                        tegOfCard = "122"
                                    }
                                } label: {
                                    HStack(alignment: .top, spacing: 10) {
                                        Text(teg.rawValue)
                                            .font(Font.custom("SF Pro Display", size: 14))
                                            .kerning(0.14)
                                            .foregroundColor(.white)
                                    }
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 10)
                                    .background(Color(red: 0.2, green: 0.39, blue: 0.88))
                                    .cornerRadius(10)
                                }
                                
                            } else {
                                Button {
                                    withAnimation {
                                        tegOfCard = teg.rawValue
                                        tegsToggle.toggle()
                                        print(tegOfCard)
                                    }
                                } label: {
                                    HStack(alignment: .top, spacing: 10) {
                                        Text(teg.rawValue)
                                            .font(Font.custom("SF Pro Display", size: 14))
                                            .kerning(0.14)
                                            .foregroundColor(.black)
                                    }
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 10)
                                    .background(Color(red: 0.97, green: 0.97, blue: 0.96))
                                    .cornerRadius(10)
                                }
                            }
                        }
                    }
                }.offset(y: -300)
                    .padding(.leading, 20)
                
                ScrollView {
                    LazyVGrid(columns: colomns, spacing: 30) {
                        ForEach(dishes, id: \.id) { item in
                            if ViewModel.matchedComparison(teg: tegOfCard, tegs: item.tegs) && tegOfCard != "122" {
                                Button {
                                    print(tegOfCard)
                                    togglePopUp.toggle()
                                    description = item.description
                                    imageUrl = item.image_url
                                    name = item.name
                                    gramm = item.weight
                                    cost = item.price
                                } label: {
                                    Card(preview: item.name, urlImage: item.image_url)
                                }
                            } else if tegOfCard == "122" {
                                Button {
                                    print(tegOfCard)
                                    togglePopUp.toggle()
                                    description = item.description
                                    imageUrl = item.image_url
                                    name = item.name
                                    gramm = item.weight
                                    cost = item.price
                                } label: {
                                    Card(preview: item.name, urlImage: item.image_url)
                                }
                            }
                            
                        }
                    }
                }
                
            }
            .onAppear{
                Task {
                    do {
                        dishes = try await Network.shared.dataRequest().dishes
                    } catch {
                        print(error)
                    }
                }
            }
            
            if togglePopUp {
                GeometryReader { _ in
                    
                    PopUp(togglePopUp: self.$togglePopUp, description: self.$description, imageUrl: self.$imageUrl, name: self.$name, gramm: self.$gramm, cost: self.$cost)
                        .offset(x: 26, y: 140)
                        .ignoresSafeArea(.all)
                    
                }.background(Color.black.opacity(0.65))
            }
            
        }.padding(.top, 20)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .navigationTitle(title ?? "title")
            .navigationBarItems(leading: Navigation(categoryToggle: false), trailing: Image("фото"))
    }
}

#Preview {
    Category(categoryToggle: Navigation().$categoryToggle)
}
