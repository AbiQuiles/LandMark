//
//  LandMarkApp.swift
//  LandMark
//
//  Created by Abiezer Quiles on 11/5/24.
//

import SwiftUI

@main
struct LandMarkApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            LandmarkList().environment(modelData)
        }
    }
}

