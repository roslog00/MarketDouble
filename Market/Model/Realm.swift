//
//  Realm.swift
//  Market
//
//  Created by Вероника Гера on 10.07.2023.
//

import Foundation
import RealmSwift


final class CardRealm : Object, ObjectKeyIdentifiable {
    
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var image: String
    @Persisted var name: String
    @Persisted var gramm: Int
    @Persisted var count: Int
    @Persisted var cost: Int
    
}
