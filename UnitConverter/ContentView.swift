//
//  ContentView.swift
//  UnitConverter
//
//  Created by H Hugo Falkman on 14/10/2019.
//  Copyright © 2019 H Hugo Falkman. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let unitTypes = ["Unit Length", "Unit Volume"]
    let unitLengths: [UnitLength] = [.meters, .kilometers, .feet, .yards, .miles]
    let unitVolumes: [UnitVolume] = [.milliliters, .liters, .cups, .pints, .gallons]
    
    @State private var input = ""
    @State private var inputUnit = 2
    @State private var outputUnit = 0
    @State private var unitType = 0
    
    var inputSymbol: String {
        switch unitType {
        case 1:
            return unitVolumes[inputUnit].symbol
        default:
            return unitLengths[inputUnit].symbol
        }
    }
    
    var output: (value: Double, symbol: String) {
        let inputValue = Double(input) ?? 0
        
        switch unitType {
        case 1:
            let measurement = Measurement(value: inputValue, unit: unitVolumes[inputUnit]).converted(to: unitVolumes[outputUnit])
            return (measurement.value, measurement.unit.symbol)
        default:
            let measurement = Measurement(value: inputValue, unit: unitLengths[inputUnit]).converted(to: unitLengths[outputUnit])
            return (measurement.value, measurement.unit.symbol)
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
                    Picker("Input Unit", selection: $inputUnit) {
                        UnitPicker(unitType: unitType, unitLengths: unitLengths, unitVolumes: unitVolumes)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("To Unit")) {
                    Picker("Output Unit", selection: $outputUnit) {
                        UnitPicker(unitType: unitType, unitLengths: unitLengths, unitVolumes: unitVolumes)
                    }
                    .pickerStyle(SegmentedPickerStyle())
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

