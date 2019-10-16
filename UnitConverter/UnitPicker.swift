//
//  UnitPicker.swift
//  UnitConverter
//
//  Created by H Hugo Falkman on 16/10/2019.
//  Copyright © 2019 H Hugo Falkman. All rights reserved.
//

import SwiftUI

struct UnitPicker: View {
    var units: [Dimension]
    
    @Binding var unit: Int
    
    var body: some View {
        Picker("", selection: $unit) {
            ForEach(0 ..< units.count) { index in
                Text(self.units[index].symbol).tag(index)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}

struct UnitPicker_Previews: PreviewProvider {
    static var previews: some View {
        UnitPicker(units: [UnitLength.meters], unit: .constant(0))
    }
}
