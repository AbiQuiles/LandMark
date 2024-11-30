//
//  MainView.swift
//  LandMark
//
//  Created by Abiezer Quiles on 11/28/24.
//

import SwiftUI

struct MainView: View {
    @State private var modelData = ModelData()
    @State private var isActive = false

    var body: some View {
        VStack {
            if isActive {
                LandmarkList().environment(modelData)
            } else {
                SplashScreen()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    isActive = true
                }
            }
        }
    }
}

#Preview {
    MainView()
}
