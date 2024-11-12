//
//  LandmarkList.swift
//  LandMark
//
//  Created by Abiezer Quiles on 11/6/24.
//

import SwiftUI

struct LandmarkList: View {
    @Environment(ModelData.self) var modelData //Permites the Observable in ModelData to be access
    @State private var showFavoritesOnly = false

       var filteredLandmarks: [Landmark] {
           modelData.landmarks.filter { landmark in
               (!showFavoritesOnly || landmark.isFavorite)
           }
       }
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
            .toolbar {
                FilterButton(filter: $showFavoritesOnly)
            }
        } detail: {
            Text("Oh oooooh!!")
        }
    }
}



#Preview {
    LandmarkList().environment(ModelData())
}
