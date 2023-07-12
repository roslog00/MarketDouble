//
//  RealmManager.swift
//  Market
//
//  Created by Вероника Гера on 10.07.2023.
//

import Foundation
import RealmSwift
import SwiftUI



final class RealmManager: ObservableObject {
    private(set) var localRealm: Realm?
    
    @Published var tasks = [CardRealm]()
    
    init() {
       openRealm()
       getCard()
    }
    
    
    func openRealm() {
        
        let _ = print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        do{
            let config = Realm.Configuration(schemaVersion : 1)
            Realm.Configuration.defaultConfiguration = config
            localRealm = try Realm()
        } catch {
            print("Error opening Realm: \(error)")
        }
    }
}

extension RealmManager {
    func getCard() -> [CardRealm] {
        if let localrealm = localRealm {
            let allTask = localrealm.objects(CardRealm.self).sorted(byKeyPath: "count")
            tasks = []
            
            allTask.forEach { task in
                tasks.append(task)
            }
        }
        return tasks
    }
}

extension RealmManager {
    func addDataToCard(nameOfItem: String, weightOfItem: Int, costOfItem: Int, imageUrlOfItem: String) {
        if let localrealm = localRealm {
            do {
                try localrealm.write {
                    let newDataToCard = CardRealm(value: ["name": nameOfItem, "gramm": weightOfItem, "image": imageUrlOfItem, "cost": costOfItem, "count": 1 ])
                    
                    localrealm.add(newDataToCard)
                }
               
            } catch {
                print("Error adding data to Realm \(error)")
            }
        }
    }
}
