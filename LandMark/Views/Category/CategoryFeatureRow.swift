//
//  CategoryFeatureRow.swift
//  LandMark
//
//  Created by Abiezer Quiles on 12/2/24.
//

import SwiftUI

struct CategoryFeatureRow: View {
    let featuredLandmarks: [Landmark]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(featuredLandmarks, id: \.self) { featureLandmark in
                    
                    NavigationLink {
                        LandmarkDetail(landmark: featureLandmark)
                    } label: {
                        FeatureItem(
                            image: featureLandmark.image,
                            name: featureLandmark.name
                        )
                    }
                }
            }
        }
    }
}

struct FeatureItem: View {
    var image: Image
    var name: String
    
    var body: some View {
        image
            .resizable()
            .frame(height: 250)
            .scaledToFill()
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .overlay {
                let bottomColor = Color.black.opacity(0.6)
                
                LinearGradient(gradient: Gradient(colors: [.clear, bottomColor]), startPoint: .center, endPoint: .bottom)
                
                Text(name)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 0))
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity,
                        alignment: .bottomLeading
                    ).padding()
            }
    }
}

#Preview {
    CategoryFeatureRow(
        featuredLandmarks: ModelData().landmarks
    )
}
