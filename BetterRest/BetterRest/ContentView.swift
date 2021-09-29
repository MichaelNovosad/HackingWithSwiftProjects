//
//  ContentView.swift
//  BetterRest
//
//  Created by Michael Novosad on 28.05.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sleepAmount = 8.0
    @State private var wakeUp = defaultWakeTime
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    var coffeeCups = 1...20
    
    var body: some View {
        NavigationView {
            Form {
                VStack(alignment: .leading, spacing: 0) {
                    Text("When do you want to wake up?")
                        .font(.headline)
                    
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                    
                }
                VStack(alignment: .leading, spacing: 0) {
                    Text("Desired amount of sleep")
                        .font(.headline)
                    
                    Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                        Text("\(sleepAmount, specifier: "%g") hours")
                    }
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Daily coffe in cups")
                        .font(.headline)
                    
                    Picker(selection: $coffeeAmount, label: Text("").bold()) {
                        ForEach(coffeeCups, id: \.self) {
                            Text("\($0)")
                                .foregroundColor(.black)
                        }
                    }
                }
                VStack(alignment: .leading, spacing: 0) {
                    Text("Your approximate bedtime is: ")
                        .font(.largeTitle)
                    Text("\(calculateBedtime())")
                        .font(.largeTitle)
                }
            }
            .navigationBarTitle("BetterRest")
        }
    }
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
    
    var coffePerDay = 1...20
    
    func calculateBedtime() -> String {
        
        let model = SleepCalculator()
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60
        
        let prediction = try?
            model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
        
        let sleepTime = wakeUp - prediction!.actualSleep
        
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        
        let totalResult = formatter.string(from: sleepTime)
        
        return totalResult
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
