//
//  HabitsTrackerApp.swift
//  HabitsTracker
//
//  Created by Michael Novosad on 17.08.2021.
//

import SwiftUI

@main
struct HabitsTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Habits())
        }
    }
}
