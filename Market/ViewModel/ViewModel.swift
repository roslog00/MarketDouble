//
//  ViewMidel.swift
//  Market
//
//  Created by Вероника Гера on 11.07.2023.
//

import Foundation
import SwiftUI
import RealmSwift

final class ViewModel: ObservableObject {
    static let task = ViewModel(); private init() {}
    
    static func calculateCost(cost: Int, addCost: Int, count: Int, plusCount: Int?, minusCount: Int?) -> Int {
        if plusCount != nil {
            return cost + (addCost * (plusCount!))
        } else if minusCount != nil {
            return cost - (addCost * (minusCount!))
        } else {
            return cost + (addCost * count)
        }
    }
    
    static func matchedComparison(teg: String, tegs: [String]) -> Bool {
        var boolTeg = false
        tegs.forEach{ tegOfArray in
            if teg == tegOfArray {
                boolTeg = true
            }
        }
        return boolTeg
    }
}

extension ViewModel {
    func count() {
        if let localrealm = RealmManager().localRealm {
            do {
                let allTask = localrealm.objects(CardRealm.self)
                
                try allTask.forEach { task in
                    if task.count == 0 {
                        try localrealm.write {
                            localrealm.delete(task)
                            RealmManager().getCard()
                            print("Task deleted!")
                        }
                    }
                }
            } catch {
                print("Error deleting taks to Realm \(error)")
            }
            
        }
    }
}
    
extension ViewModel {
    
    func countMinus(id: ObjectId, count: Int) {
        if let localrealm = RealmManager().localRealm {
            do {
                let taskToUpdate = localrealm.objects(CardRealm.self).filter(NSPredicate(format: "id == %@", id))
                
                guard !taskToUpdate.isEmpty else { return }
                
                try localrealm.write {
                    taskToUpdate[0].count -= count
                    print("Task apdated!")
                }
                
                RealmManager().getCard()
            } catch {
                print("Error updating task to Realm \(error)")
            }
        }
    }
}



extension ViewModel {
    
    func countPlus(count: Int, id: ObjectId) {
        if let localrealm = RealmManager().localRealm {
            do {
                let taskToUpdate = localrealm.objects(CardRealm.self).filter(NSPredicate(format: "id == %@", id))
                
                guard !taskToUpdate.isEmpty else { return }
                
               try localrealm.write {
                    taskToUpdate[0].count += count
                    print("Task apdated!")
                }
                
                RealmManager().getCard()
            } catch {
                print("Error updating task to Realm \(error)")
            }
        }
    }
}
