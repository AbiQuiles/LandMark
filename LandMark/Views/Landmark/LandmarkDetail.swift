//
//  LandmarkDetail.swift
//  LandMark
//
//  Created by Abiezer Quiles on 11/6/24.
//

import SwiftUI

struct LandmarkDetail: View {
    var body: some View {
        VStack {
            MapView()
                .frame(height: 300)
            CircleImage()
                .offset(y: -100)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                
                Text("Rock Turtle")
                    .font(.title)
                    .fontWeight(.semibold)
                
                HStack {
                    Text("Dr.Phillip National Park")
                        .font(.subheadline)
                    Spacer()
                    Text("Califonia, USA")
                        .font(.subheadline)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider()
                
                Text("About Turtle Rock")
                    .font(.title2)
                
                Text("Descriptive text goes here.")
            }
            
            .padding()
        }
        
        Spacer()
    }
}

#Preview {
    LandmarkDetail()
}
