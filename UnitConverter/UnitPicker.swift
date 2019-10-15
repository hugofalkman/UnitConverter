//
//  UnitPicker.swift
//  UnitConverter
//
//  Created by H Hugo Falkman on 14/10/2019.
//  Copyright © 2019 H Hugo Falkman. All rights reserved.
//

import SwiftUI

struct UnitPicker: View {
    var unitType: Int
    var unitLengths: [UnitLength]
    var unitVolumes: [UnitVolume]
    
    var body: some View {
        if unitType == 1 {
            return ForEach(0 ..< self.unitVolumes.count) { index in
                Text(self.unitVolumes[index].symbol).tag(index)
            }
        } else {
            return ForEach(0 ..< self.unitLengths.count) { index in
                Text(self.unitLengths[index].symbol).tag(index)
            }
        }
    }
}

struct UnitPicker_Previews: PreviewProvider {
    static var previews: some View {
        UnitPicker(unitType: 1, unitLengths: [.meters], unitVolumes: [.liters])
    }
}
