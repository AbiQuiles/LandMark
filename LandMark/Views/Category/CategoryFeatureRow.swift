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
            HStack(spacing: 10) {
                ForEach(featuredLandmarks, id: \.self) { featureLandmark in
                    
                    NavigationLink {
                        LandmarkDetail(landmark: featureLandmark)
                    } label: {
                        FeatureItem(
                            image: featureLandmark.image,
                            name: featureLandmark.name,
                            park: featureLandmark.park
                        )
                    }
                }
            }.padding()
        }
    }
}

//Own Implementation
struct FeatureItem: View {
    var image: Image
    var name: String
    var park: String
    
    var body: some View {
        image
            .resizable()
            .frame(width: 370, height: 320)
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .overlay {
                let bottomColor = Color.black.opacity(0.6)
                
                LinearGradient(
                    gradient: Gradient(colors: [.clear, bottomColor]),
                    startPoint: .center,
                    endPoint: .bottom
                )
                
                VStack(alignment: .leading) {
                    Text(name)
                        .font(.title)
                        .fontWeight(.semibold)
                   Text(park)
                }
                .foregroundStyle(.white)
                .padding()
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity,
                    alignment: .bottomLeading
                )

            }
    }
}

//Apple DevSite Implementation
struct FeatureCard: View {
    var landmark: Landmark


    var body: some View {
        landmark.image
            .resizable()
            .overlay {
                TextOverlay(landmark: landmark)
            }
    }
}


struct TextOverlay: View {
    var landmark: Landmark


    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }


    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                    .bold()
                Text(landmark.park)
            }
            .padding()
        }
        .foregroundStyle(.white)
    }
}


#Preview {
    CategoryFeatureRow(
        featuredLandmarks: ModelData().landmarks
    )
}

//#Preview {
//    FeatureCard(
//        landmark: ModelData().landmarks[0]
//    ).aspectRatio(3/2, contentMode: .fit)
//}
