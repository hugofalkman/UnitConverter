//
//  ContentView.swift
//  UnitConverter
//
//  Created by H Hugo Falkman on 14/10/2019.
//  Copyright © 2019 H Hugo Falkman. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let unitTypeLabels = ["Unit Length", "Unit Area", "Unit Volume"]
    let unitLengths: [UnitLength] = [.meters, .kilometers, .feet, .yards, .miles]
    let unitAreas: [UnitArea] = [.squareMeters, .hectares, .squareFeet, .acres, .squareMiles]
    let unitVolumes: [UnitVolume] = [.milliliters, .liters, .cups, .pints, .gallons]
    
    @State private var input = ""
    @State private var inputUnit = 2
    @State private var outputUnit = 0
    @State private var unitType = 0
    
    var unitTypes: [Dimension] {
        let types: [[Dimension]] = [unitLengths, unitAreas, unitVolumes]
        return types[unitType]
    }
    
    var units: [String] {
        unitTypes.map { $0.symbol }
    }
    
    var output: Double {
        let inputValue = Double(input) ?? 0
        
        if inputUnit < unitTypes.count && outputUnit < unitTypes.count {
            return Measurement(value: inputValue, unit: unitTypes[inputUnit]).converted(to: unitTypes[outputUnit]).value
        }
        return 0
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("From:")) {
                    HStack {
                        TextField("Value", text: $input)
                            .frame(width: 150)
                            .keyboardType(.decimalPad)
                        Text(inputUnit < units.count ? units[inputUnit] : "")
                        Spacer()
                    }
                }
                
                Section(header: Text("Unit Type")) {
                    UnitPicker(units: unitTypeLabels, unit: $unitType)
                }
                
                Section(header: Text("From Unit")) {
                    UnitPicker(units: units, unit: $inputUnit)
                        .id(unitType)
                }
                
                Section(header: Text("To Unit")) {
                    UnitPicker(units: units, unit: $outputUnit)
                        .id(unitType)
                }
                
                Section(header: Text("To:")) {
                    HStack {
                        Text("\(output, specifier: "%g") ")
                        Text(outputUnit < units.count ? units[outputUnit] : "")
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

