//
//  DataController.swift
//  Bookworm
//
//  Created by Gökberk Ali Kulaç on 10.02.2023.
//
import CoreData
import Foundation

class DataController : ObservableObject{
    let container = NSPersistentContainer(name: "Bookworm")
    
    init() {
        container.loadPersistentStores { descrition, error in
            if let error = error{
                print("Core data failed to load : \(error.localizedDescription)")
            }
        }
    }
}
