//
//  AddHabit.swift
//  HabitsTracker
//
//  Created by Michael Novosad on 17.08.2021.
//

import SwiftUI

struct AddHabit: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var habits: Habits
    @State private var name = ""
    @State private var description = ""
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                TextField("Description", text: $description)
            }
            .navigationBarTitle("Add new habit")
            .navigationBarItems(trailing: Button("Save") {
                self.presentationMode.wrappedValue.dismiss()
            })
            .onDisappear {
                if name != "" && description != "" {
                    let item = HabitItems(name: self.name, description: self.description)
                    self.habits.items.append(item)
                }
            }
        }
    }
}

struct AddHabit_Previews: PreviewProvider {
    static var previews: some View {
        AddHabit(habits: Habits())
    }
}
