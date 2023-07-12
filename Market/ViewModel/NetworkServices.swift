//
//  NetworkServices.swift
//  Market
//
//  Created by Вероника Гера on 08.07.2023.
//

import Foundation
import SwiftUI

struct Network {
    static let shared = Network(); private init() { }
    
    static private var urlForMainScreen : URL? {
        URL(string: "https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54")
    }
    
    static private var urlForCategoryScreen : URL? {
        URL(string:  "https://run.mocky.io/v3/aba7ecaa-0a70-453b-b62d-0e326c859b3b")
    }
}

extension Network {
    func fetchRequest() async throws -> User {
       guard let url = Network.urlForMainScreen else {
           throw NetworkingError.badUrl
       }
       
       let response = try await URLSession.shared.data(from: url)
       let decoder = JSONDecoder()
       let result = try decoder.decode(User.self, from: response.0)
       
       return result
   }
    
    
     func dataRequest() async throws -> Dish {
        guard let url = Network.urlForCategoryScreen else {
            throw NetworkingError.badUrl
        }
        
        let response = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let result = try decoder.decode(Dish.self, from: response.0)
        
        return result
    }
}

enum NetworkingError: Error {
    case badUrl, badRequest, badResponse
}


