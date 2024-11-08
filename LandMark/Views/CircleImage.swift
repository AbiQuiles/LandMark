//
//  CircleImage.swift
//  LandMark
//
//  Created by Abiezer Quiles on 11/5/24.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("turtlerock")
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 3)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    CircleImage()
}
