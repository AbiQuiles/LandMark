//
//  CategoryRow.swift
//  LandMark
//
//  Created by Abiezer Quiles on 11/30/24.
//

import SwiftUI

struct CategoryRow: View {
    let categoryTitle: String
    var landmarks: [Landmark]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryTitle)
                .font(.title2)
                .fontWeight(.semibold)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(landmarks) { landmark in
                        CategoryItem(
                            image: landmark.image,
                            name: landmark.name
                        )
                    }
                }
            }
        }.padding()
    }
}

struct CategoryItem: View {
    var image: Image
    var name: String
    
    var body: some View {
        VStack {
            image
                .resizable()
                .frame(width: 155, height: 155)
                .clipShape(RoundedRectangle(cornerRadius: 5))
            
            Text(name)
                .foregroundStyle(.blue)
        }
    }
}

#Preview {
    let landmarks = ModelData().landmarks
    let categoryTitle = landmarks[0].category.rawValue
    
    CategoryRow(
        categoryTitle: categoryTitle,
        landmarks: landmarks
    )
}