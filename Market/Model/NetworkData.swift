//
//  NetworkData.swift
//  Market
//
//  Created by Вероника Гера on 08.07.2023.
//

import Foundation

struct User: Decodable {
    let сategories : [UserResult]
}

struct UserResult: Decodable {
    var id : Int
    var name : String
    var image_url : String
}


struct Dish : Decodable {
    let dishes : [Dishes]
}

struct Dishes: Decodable {
    var id : Int
    var name : String
    var price : Int
    var weight : Int
    var description : String
    var image_url : String
    var tegs : [String]
}
