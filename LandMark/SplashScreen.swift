//
//  SplashScreen.swift
//  LandMark
//
//  Created by Abiezer Quiles on 11/28/24.
//

import SwiftUI

struct SplashScreen: View {
    private let color: Color = Color(red: 79.0 / 255, green: 79.0 / 255, blue: 191.0 / 255)
    
    private let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    private let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [gradientStart, gradientEnd],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 20) {
                BadgeSymbol(symbolColorTop: Color.white)
                    .padding(.top, 150)
                
                Text("Landmark")
                    .font(Font.system(size: 50))
                    .fontWeight(.semibold)
            }
            //.border(Color.red)
            
//            Text("Landmark")
//                .font(Font.system(size: 50))
//                .fontWeight(.bold)
//            Image("landmarkAppSplash")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    SplashScreen()
}
