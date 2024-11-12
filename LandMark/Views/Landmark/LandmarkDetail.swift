//
//  LandmarkDetail.swift
//  LandMark
//
//  Created by Abiezer Quiles on 11/6/24.
//

import SwiftUI

struct LandmarkDetail: View {
    @Environment(ModelData.self) var modelData: ModelData
    
    var landmark: Landmark
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { landmarkSelf in
            landmarkSelf.id == landmark.id
        })!
    }
    
    var body: some View {
        @Bindable var modelData = modelData
        
        let isFavorite = $modelData.landmarks[landmarkIndex].isFavorite
        
        VStack {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300)
            
            HStack {
                CircleImage(image: landmark.image)
                    .offset(y: -100)
                    .padding(.bottom, -120)
                FavoriteButton(isFavorite: isFavorite)
                    .frame(alignment: .leading)
            }
            
            VStack(alignment: .leading) {
                
                HStack {
                    Text(landmark.name)
                        .font(.title)
                        .fontWeight(.semibold)
                }
                
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
    let modelData = ModelData()
    return LandmarkDetail(
        landmark: modelData.landmarks[0]
    ).environment(modelData)
}
