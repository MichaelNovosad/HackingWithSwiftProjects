//
//  ContentView.swift
//  HabitsTracker
//
//  Created by Michael Novosad on 17.08.2021.
//

import SwiftUI

struct HabitItems: Identifiable, Codable {
    var id = UUID()
    var name: String
    var description: String
}

class Habits: ObservableObject {
    @Published var items = [HabitItems]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([HabitItems].self, from: items) {
                self.items = decoded
                return
            }
        }
        self.items = []
    }
    
}

struct ContentView: View {
    
    @ObservedObject var habits = Habits()
    @State private var showingAddHabit = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(habits.items) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                NavigationLink(
                                    destination: HabitView(habits: habits),
                                    label: {
                                        Text(item.name)
                                    })
                                    .font(.headline)
                            }
                        }
                    }
                    .onDelete(perform: removeItems)
                }
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        EditButton()
                        Button(action: {
                            self.showingAddHabit = true
                        }) {
                            Image(systemName: "plus")
                        }
                        .sheet(isPresented: $showingAddHabit, content: {
                            AddHabit(habits: self.habits)
                        })
                    }
                }
            }
            .padding()
            .navigationBarTitle("HabitsTracker")
        }
    }
    func removeItems(at offsets: IndexSet) {
        habits.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
