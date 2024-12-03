//
//  CategoryHome.swift
//  LandMark
//
//  Created by Abiezer Quiles on 11/30/24.
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        let featuredLandmarks = modelData.features
        let categories = modelData.categories.keys.sorted()
        
        NavigationSplitView {
            List {
                CategoryFeatureRow(
                    featuredLandmarks: featuredLandmarks
                ).listRowInsets(EdgeInsets())
                
                //Here we are using the item name as an Unique Id, aka categories.
                //If this was a more complext list with dynamic views or we had the case
                // that we be removing and adding views than in that case UUID() is the way to go.
                //Using item name as Unique Id is fine when it come to simple views, static views
                // or non dynamic views.
                ForEach(categories, id: \.self) { key in
                    let landmarks = modelData.categories[key] ?? Array<Landmark>()
                    
                    CategoryRow(
                        categoryTitle: key,
                        landmarks: landmarks
                    ).listRowInsets(EdgeInsets())
                }
            }
            
            .navigationTitle("Featured")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
