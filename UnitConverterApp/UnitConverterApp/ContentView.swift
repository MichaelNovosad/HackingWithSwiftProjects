//
//  ContentView.swift
//  UnitConverterApp
//
//  Created by Michael Novosad on 17.05.2021.
//

import SwiftUI

struct ContentView: View {
    
    // ATTENTION! I left part of my code below as commented for further work after I know how to navigate through views in SwiftUI. My idea is to make different windows for different type conversions e.g. temperature with it's list, length with it's list and so on. Hope, it won't be too long 20.05.21
    
    @State private var inputNumber = ""
    @State private var inputUnit = 0
    @State private var outputUnit = 1
//    @State private var conversionTypeListSelection = 0
    
//    let conversionTypeList = ["Temperature", "Length", "Time", "Volume"]
    
    let temperatureTypeList = ["Celsius", "Fahrenheit", "Kelvin"]
    
//    let lengthTypeList = ["Meters", "Kilometers", "Feet", "Yards", "Miles"]
//
//    let timeTypeList = ["Seconds", "Minutes", "Hours"]
//
//    let volumeTypeList = ["Milliliters", "Liters", "Cups", "Pints", "Gallons"]
    
    var writtenInputNumber: Double {
        Double(inputNumber) ?? 0.0
    }
    
    // temperature conversion using Measurement class
    func temperatureConversion() -> Double {
        
        let temperatureNumber = writtenInputNumber
        let inputUnitChooser = temperatureTypeList[inputUnit]
        let outputUnitChooser = temperatureTypeList[outputUnit]
        
        let temperatureResult = 0.0
        
        let celsiusNumber = Measurement(value: temperatureNumber, unit: UnitTemperature.celsius)
        let celsiusToFahrenheit = celsiusNumber.converted(to: UnitTemperature.fahrenheit)
        let celsiusToKelvin = celsiusNumber.converted(to: UnitTemperature.kelvin)
        
        let fahrenheitNumber = Measurement(value: temperatureNumber, unit: UnitTemperature.fahrenheit)
        let fahrenheitToCelsius = fahrenheitNumber.converted(to: UnitTemperature.celsius)
        let fahrenheitToKelvin = fahrenheitNumber.converted(to: UnitTemperature.kelvin)
        
        let kelvinNumber = Measurement(value: temperatureNumber, unit: UnitTemperature.kelvin)
        let kelvinToCelsius = kelvinNumber.converted(to: UnitTemperature.celsius)
        let kelvinToFahrenheit = kelvinNumber.converted(to: UnitTemperature.fahrenheit)
        
        if inputUnitChooser == "Celsius" && outputUnitChooser == "Celsius" {
            let temperatureResult = celsiusNumber
            return temperatureResult.value
        } else {
            if inputUnitChooser == "Fahrenheit" && outputUnitChooser == "Celsius"  {
                let temperatureResult = fahrenheitToCelsius
                return temperatureResult.value
            } else {
                if inputUnitChooser == "Kelvin" && outputUnitChooser == "Celsius" {
                    let temperatureResult = kelvinToCelsius
                    return temperatureResult.value
                } else {
                    if inputUnitChooser == "Celsius" && outputUnitChooser == "Fahrenheit"  {
                        let temperatureResult = celsiusToFahrenheit
                        return temperatureResult.value
                    } else {
                        if inputUnitChooser == "Celsius" && outputUnitChooser == "Kelvin" {
                            let temperatureResult = celsiusToKelvin
                            return temperatureResult.value
                        } else {
                            if inputUnitChooser == "Fahrenheit" && outputUnitChooser == "Kelvin" {
                                let temperatureResult = fahrenheitToKelvin
                                return temperatureResult.value
                            } else {
                                if inputUnitChooser == "Kelvin" && outputUnitChooser == "Fahrenheit" {
                                    let temperatureResult = kelvinToFahrenheit
                                    return temperatureResult.value
                                } else {
                                    if inputUnitChooser == "Kelvin" && outputUnitChooser == "Kelvin" {
                                        let temperatureResult = kelvinNumber
                                        return temperatureResult.value
                                    } else {
                                        if inputUnitChooser == "Fahrenheit" && outputUnitChooser == "Fahrenheit" {
                                            let temperatureResult = fahrenheitNumber
                                            return temperatureResult.value
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return temperatureResult
    }
    
    
    var totalTemperatureResult: Double {
        var temperatureNumber = Double(writtenInputNumber)
        
        temperatureNumber = temperatureConversion()
        
        return temperatureNumber
    }
    

    
    
//
//    // length conversion using Measurement class
//    func lengthConversion() -> Double {
//
//        let lengthNumber = writtenInputNumber
//        let inputUnitChooser = lengthTypeList[inputUnit]
//        let outputUnitChooser = lengthTypeList[outputUnit]
//
//        let lengthResult = 0.0
//
//        let lengthMeters = Measurement(value: lengthNumber, unit: UnitLength.meters)
//        let lengthKilometers = lengthMeters.converted(to: UnitLength.kilometers)
//        let lengthFeet = lengthMeters.converted(to: UnitLength.feet)
//        let lengthYards = lengthMeters.converted(to: UnitLength.yards)
//        let lengthMiles = lengthMeters.converted(to: UnitLength.miles)
//
//        if inputUnitChooser == "Meters" && outputUnitChooser == "Meters" {
//            let lengthResult = lengthMeters
//            return lengthResult.value
//        } else {
//            if inputUnitChooser == "Meters" && outputUnitChooser == "Kilometers" {
//                let lengthResult = lengthKilometers
//                return lengthResult.value
//            } else { if inputUnitChooser == "Meters" && outputUnitChooser == "Feet" {
//                let lengthResult = lengthFeet
//                return lengthResult.value
//                } else {
//                    if inputUnitChooser == "Meters" && outputUnitChooser == "Yards" {
//                        let lengthResult = lengthYards
//                        return lengthResult.value
//                    } else {
//                        if inputUnitChooser == "Meters" && outputUnitChooser == "Miles" {
//                            let lengthResult = lengthMiles
//                            return lengthResult.value
//                        }
//                    }
//                }
//            }
//        }
//        return lengthResult
//    }
//
     
     
//     // time conversion using Measurement class
//     func timeConversion() -> Double {
//     let timeSeconds = Measurement(value: 60, unit: UnitDuration.seconds)
//     let timeMinutes = timeSeconds.converted(to: UnitDuration.minutes)
//     let timeHours = timeSeconds.converted(to: UnitDuration.hours)
//
//     }
//
//     // volume conversion using Measurement class
//     func volumeConversion() -> Double {
//     let volumeMilliliters = Measurement(value: 1000, unit: UnitVolume.milliliters)
//     let volumeLiters = volumeMilliliters.converted(to: UnitVolume.liters)
//     let volumeCups = volumeMilliliters.converted(to: UnitVolume.cups)
//     let volumePints = volumeMilliliters.converted(to: UnitVolume.pints)
//     let volumeGallons = volumeMilliliters.converted(to: UnitVolume.gallons)
//     }
//
 
    var body: some View {
        NavigationView {
            Form {
//                Section(header: Text("Choose conversion type")) {
//                    Picker("Conversion type", selection: $conversionTypeListSelection) {
//                        ForEach(0 ..< conversionTypeList.count) {
//                            Text("\(self.conversionTypeList[$0])")
//                        }
//                    }
//                }
                Section {
                    TextField("Temperature number", text:$inputNumber) .keyboardType(.numberPad)
                }
                Section(header: Text("Choose your temperature type")) {
                    Picker("Conversion type", selection: $inputUnit) {
                        ForEach(0 ..< temperatureTypeList.count) {
                            Text("\(self.temperatureTypeList[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Choose your conversion type")) {
                    Picker("Conversion type", selection: $outputUnit) {
                        ForEach(0 ..< temperatureTypeList.count) {
                            Text("\(self.temperatureTypeList[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Conversion result")) {
                    Text("\(totalTemperatureResult, specifier: "%.2f")")
                }
            }
        }
    }
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

