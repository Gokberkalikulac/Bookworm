//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Gökberk Ali Kulaç on 10.02.2023.
//

import SwiftUI

@main
struct BookwormApp: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
