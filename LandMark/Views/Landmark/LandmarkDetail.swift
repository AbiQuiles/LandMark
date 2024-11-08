//
//  LandmarkDetail.swift
//  LandMark
//
//  Created by Abiezer Quiles on 11/6/24.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark
    
    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300)
            
            CircleImage(image: landmark.image)
                .offset(y: -100)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                
                Text(landmark.name)
                    .font(.title)
                    .fontWeight(.semibold)
                
                HStack {
                    Text(landmark.park)
                        .font(.subheadline)
                    Spacer()
                    Text(landmark.state)
                        .font(.subheadline)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider()
                
                Text("About: \(landmark.name)")
                    .font(.title2)
                
                Text(landmark.description)
            }
            
            .padding()
        }
        
        Spacer()
    }
}

#Preview {
    LandmarkDetail(landmark: landmarks[0])
}
