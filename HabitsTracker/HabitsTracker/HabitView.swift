//
//  HabitView.swift
//  HabitsTracker
//
//  Created by Michael Novosad on 17.08.2021.
//

import SwiftUI

struct HabitView: View {
    
    @StateObject var habits: Habits
    
    var body: some View {
        NavigationView {
            
             //   Text(habit.name)
               // Text(habit.description)
        }
      //  .navigationBarTitle(Text(habit.name), displayMode: .inline)
    }
}

struct HabitView_Previews: PreviewProvider {
    static var previews: some View {
        HabitView(habits: Habits())
    }
}
