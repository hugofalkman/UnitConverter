//
//  LengthPicker.swift
//  UnitConverter
//
//  Created by H Hugo Falkman on 16/10/2019.
//  Copyright © 2019 H Hugo Falkman. All rights reserved.
//

import SwiftUI

struct LengthPicker: View {
    var unitLengths: [UnitLength]
    
    @Binding var lengthUnit: Int
    
    var body: some View {
        Picker("", selection: $lengthUnit) {
            ForEach(0 ..< unitLengths.count) { index in
                Text(self.unitLengths[index].symbol).tag(index)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}

struct LengthPicker_Previews: PreviewProvider {
    static var previews: some View {
        LengthPicker(unitLengths: [.meters], lengthUnit: .constant(0))
    }
}
