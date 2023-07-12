//
//  ScrollView.swift
//  Market
//
//  Created by Вероника Гера on 08.07.2023.
//

import SwiftUI
import NukeUI

struct Scroll: View {
    
    @State var data : [UserResult] = []
    
    var body: some View {
        NavigationView {
            if data.isEmpty { Text("loading") }  else {
                ScrollView(showsIndicators: false){
                    ForEach(data, id: \.id) { result in
                        NavigationLink(destination: Category(categoryToggle: Navigation().$categoryToggle, title: result.name)) {
                            ZStack(alignment: .topLeading) {
//                                AsyncImage(url: URL(string: result.image_url), scale: CGFloat(2.75))
//                                    .frame(width: 343, height: 148)
                                LazyImage(url: URL(string: result.image_url)!) { state in
                                    if let image = state.image {
                                        image.resizable().aspectRatio(contentMode: .fit)
                                    }
                                }
                                    
                                
                                Text(result.name)
                                    .lineLimit(2)
                                    .padding(.leading, 16)
                                    .padding(.top, 12)
                                    .font(Font.custom("SF Pro Display", size: 20).weight(.medium))
                                    .kerning(0.2)
                                    .foregroundColor(.black)
                                    .frame(width: 191, height: 50, alignment: .leading)
                                    
                            }
                            .frame(width: 343, height: 148)
                            .background(Color(red: 1, green: 0.95, blue: 0.82))
                            .cornerRadius(10)
                        }
                        
                    }
                }.padding(.top, 20)
                    .navigationBarBackButtonHidden(true)
                    .navigationBarItems(leading: Navigation(categoryToggle: true), trailing: Image("фото"))
            }
        }
        .onAppear{
            Task {
                do {
                    data = try await Network.shared.fetchRequest().сategories
                } catch {
                    dump(error)
                }
            }
        }
        
    }
    
}

#Preview {
    Scroll()
}
