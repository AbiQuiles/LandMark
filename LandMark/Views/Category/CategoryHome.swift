//
//  CategoryHome.swift
//  LandMark
//
//  Created by Abiezer Quiles on 11/30/24.
//

import SwiftUI


struct CategoryHome: View {
    //Permites the Observable in ModelData to be access
    @Environment(ModelData.self) var modelData
    @State private var showingProfile = false
    
    var body: some View {
        let featuredLandmarks = modelData.features
        let categories = modelData.categories.keys.sorted()
        
        NavigationSplitView {
            List {
                
//Apple Implementation Using UIKit
//                PageView(
//                    pages: featuredLandmarks.map {
//                        FeatureCard(landmark: $0)
//                    }
//                ).listRowInsets(EdgeInsets())
                
//Own Implementation
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
            .listStyle(.inset)
            .navigationTitle("Featured")
            .toolbar {
                ProfileButton(navigate: $showingProfile)
            }.sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environment(modelData)
            }
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
