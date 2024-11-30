//
//  RotatedBadgeSymbol.swift
//  LandMark
//
//  Created by Abiezer Quiles on 11/16/24.
//

import SwiftUI

//This view purposes is to test rotation to shapes

struct RotatedBadgeSymbol: View {
    let angle: Angle
    
    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

#Preview {
    RotatedBadgeSymbol(angle: Angle(degrees: 5))
}
