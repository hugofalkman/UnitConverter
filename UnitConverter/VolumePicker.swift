//
//  VolumePicker.swift
//  UnitConverter
//
//  Created by H Hugo Falkman on 16/10/2019.
//  Copyright © 2019 H Hugo Falkman. All rights reserved.
//

import SwiftUI

struct VolumePicker: View {
    var unitVolumes: [UnitVolume]
    
    @Binding var volumeUnit: Int
    
    var body: some View {
        Picker("", selection: $volumeUnit) {
            ForEach(0 ..< unitVolumes.count) { index in
                Text(self.unitVolumes[index].symbol).tag(index)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}

struct VolumePicker_Previews: PreviewProvider {
    static var previews: some View {
        VolumePicker(unitVolumes: [.liters], volumeUnit: .constant(0))
    }
}
