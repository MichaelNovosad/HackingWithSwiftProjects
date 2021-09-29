//
//  EdutainmentCountGameApp.swift
//  EdutainmentCountGame
//
//  Created by Michael Novosad on 04.06.2021.
//

import SwiftUI

@main
struct EdutainmentCountGameApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(questions: GameConditions(), stepper: GameConditions(), game: Game())
                .environmentObject(GameConditions())
        }
    }
}
