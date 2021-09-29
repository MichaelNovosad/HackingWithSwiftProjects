//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Michael Novosad on 20.08.2021.
//

import SwiftUI

@main
struct BookwormApp: App {
    let persistenceContainer = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceContainer.container.viewContext)

        }
    }
}
