//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Michael Novosad on 03.09.2021.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
