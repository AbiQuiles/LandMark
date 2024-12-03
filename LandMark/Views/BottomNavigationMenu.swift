//
//  BottomNavigationMenu.swift
//  LandMark
//
//  Created by Abiezer Quiles on 12/2/24.
//

import SwiftUI

struct BottomNavigationMenu: View {
    @State private var selection: Tab = .featured


    enum Tab {
        case featured
        case list
    }


    var body: some View {
        TabView {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
            LandmarkList()
                .tabItem {
                    Label("Landmarks", systemImage: "list.bullet")
                        //.labelStyle(.titleAndIcon)
                }
        }
    }
}

#Preview {
    BottomNavigationMenu()
        .environment(ModelData())
}
