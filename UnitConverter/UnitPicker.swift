//
//  UnitPicker.swift
//  UnitConverter
//
//  Created by H Hugo Falkman on 16/10/2019.
//  Copyright © 2019 H Hugo Falkman. All rights reserved.
//

import SwiftUI

struct UnitPicker: View {
    var units: [String]
    
    @Binding var unit: Int
    
    var body: some View {
        Picker("", selection: $unit) {
            ForEach(units.indices, id: \.self) { index in
                Text(self.units[index]).tag(index)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .font(.largeTitle)
    }
}

struct UnitPicker_Previews: PreviewProvider {
    static var previews: some View {
        UnitPicker(units: ["m", "km", "ft", "ya", "mi"], unit: .constant(0))
    }
}
