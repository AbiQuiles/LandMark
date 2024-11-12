//
//  CircleImage.swift
//  LandMark
//
//  Created by Abiezer Quiles on 11/5/24.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 3)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    CircleImage(image: Image("tutlerock"))
}
