//
//  LandmarkRow.swift
//  LandMark
//
//  Created by Abiezer Quiles on 11/5/24.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
    }
}

#Preview("Collection View") {
    let landmarks: [Landmark] = ModelData().landmarks
    
    return Group {
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
    }
}
//#Preview("Turtle Rock") {
//    LandmarkRow(landmark: landmarks[0])
//}
//#Preview("Salmon") {
//    LandmarkRow(landmark: landmarks[1])
//}
