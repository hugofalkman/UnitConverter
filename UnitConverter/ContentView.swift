//
//  ContentView.swift
//  UnitConverter
//
//  Created by H Hugo Falkman on 14/10/2019.
//  Copyright © 2019 H Hugo Falkman. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let unitTypes = ["Unit Length", "Unit Area", "Unit Volume"]
    let unitLengths: [UnitLength] = [.meters, .kilometers, .feet, .yards, .miles]
    let unitAreas: [UnitArea] = [.squareMeters, .hectares, .squareFeet, .acres, .squareMiles]
    let unitVolumes: [UnitVolume] = [.milliliters, .liters, .cups, .pints, .gallons]
    
    @State private var input = ""
    @State private var inputUnit = 2
    @State private var outputUnit = 0
    @State private var unitType = 0
    
    var inputSymbol: String {
        switch unitType {
        case 1:
            if inputUnit < unitAreas.count {
                return unitAreas[inputUnit].symbol
            }
            return ""
        case 2:
            if inputUnit < unitVolumes.count {
                return unitVolumes[inputUnit].symbol
            }
            return ""
        default:
            if inputUnit < unitLengths.count {
                return unitLengths[inputUnit].symbol
            }
            return ""
        }
    }
    
    var output: (value: Double, symbol: String) {
        let inputValue = Double(input) ?? 0
        
        switch unitType {
        case 1:
            if inputUnit < unitAreas.count && outputUnit < unitAreas.count {
                let measurement = Measurement(value: inputValue, unit: unitAreas[inputUnit]).converted(to: unitAreas[outputUnit])
                return (measurement.value, measurement.unit.symbol)
            }
            return (0, "")
        case 2:
            if inputUnit < unitVolumes.count && outputUnit < unitVolumes.count {
                let measurement = Measurement(value: inputValue, unit: unitVolumes[inputUnit]).converted(to: unitVolumes[outputUnit])
                return (measurement.value, measurement.unit.symbol)
            }
            return (0, "")
        default:
            if inputUnit < unitLengths.count && outputUnit < unitLengths.count {
                let measurement = Measurement(value: inputValue, unit: unitLengths[inputUnit]).converted(to: unitLengths[outputUnit])
                return (measurement.value, measurement.unit.symbol)
            }
            return (0, "")
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("From:")) {
                    HStack {
                        TextField("Value", text: $input)
                            .frame(width: 150)
                            .keyboardType(.decimalPad)
                        Text(inputSymbol)
                        Spacer()
                    }
                }
                
                Section(header: Text("Unit Type")) {
                    Picker("Unit Type", selection: $unitType) {
                        ForEach(0 ..< self.unitTypes.count) {
                            Text(self.unitTypes[$0])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("From Unit")) {
                    if unitType == 1 {
                        UnitPicker(units: unitAreas, unit: $inputUnit)
                    } else if unitType == 2 {
                        UnitPicker(units: unitVolumes, unit: $inputUnit)
                    } else {
                        UnitPicker(units: unitLengths, unit: $inputUnit)
                    }
                }
                
                Section(header: Text("To Unit")) {
                    if unitType == 1 {
                        UnitPicker(units: unitAreas, unit: $outputUnit)
                    } else if unitType == 2 {
                        UnitPicker(units: unitVolumes, unit: $outputUnit)
                    } else {
                        UnitPicker(units: unitLengths, unit: $outputUnit)
                    }
                }
                
                Section(header: Text("To:")) {
                    HStack {
                        Text("\(output.value, specifier: "%g") ")
                        Text(output.symbol)
                    }
                }
            }
            .navigationBarTitle("Unit Converter ")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

