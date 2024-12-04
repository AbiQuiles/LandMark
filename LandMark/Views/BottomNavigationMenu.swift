//
//  BottomNavigationMenu.swift
//  LandMark
//
//  Created by Abiezer Quiles on 12/2/24.
//

import SwiftUI


///Implicit Selection: The TabView implicitly manages the selected tab based on the order of the tabs.
///No Explicit Tagging: The first tab is selected by default.
///
///Simple Scenarios: If you have a simple TabView where the default behavior is sufficient, this approach is more concise.
///Fixed Tab Order: The order of the tabs determines the selection.
///In most cases, Case 1 provides more flexibility and control over the tab selection behavior. However, for simple scenarios, Case 2 can be a simpler approach.
struct BottomNavigationMenu: View {

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

///Explicit State Management: A @State variable selection is used to track the currently selected tab.
///Tagging Tabs: Each tab is assigned a specific Tab enum case using the .tag() modifier.
///Binding to selection: The TabView's selection parameter is bound to the $selection state variable.
///
///More Control: You have more control over the tab selection and can easily switch between tabs programmatically.
///Complex Scenarios: It's useful when you need to perform actions based on the current tab selection or when you want to dynamically update the selected tab.
struct AppleTabsNavugationApproche: View {
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            
            
            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}

#Preview {
    BottomNavigationMenu()
        .environment(ModelData())
}
