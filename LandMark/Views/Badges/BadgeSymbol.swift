//
//  BadgeSymbol.swift
//  LandMark
//
//  Created by Abiezer Quiles on 11/13/24.
//

import SwiftUI

struct BadgeSymbol: View {
    var symbolColorTop: Color = Color(red: 79.0 / 255, green: 79.0 / 255, blue: 191.0 / 255)
    var symbolColorBottom: Color = Color(red: 79.0 / 255, green: 79.0 / 255, blue: 191.0 / 255)
    
    var body: some View {
        
        GeometryReader { geometry in
            let width = min(geometry.size.width, geometry.size.height)
            let height = width * 0.75
            let spacing = width * 0.030
            let middle = width * 0.5
            let topWidth = width * 0.226
            let topHeight = height * 0.488
            
            Path { path in
                
                path.addLines([
                    CGPoint(x: middle, y: spacing),
                    CGPoint(x: middle - topWidth, y: topHeight - spacing),
                    CGPoint(x: middle, y: topHeight / 2 + spacing),
                    CGPoint(x: middle + topWidth, y: topHeight - spacing),
                    CGPoint(x: middle, y: spacing)
                ])

                //path.move(to: CGPoint(x: middle, y: topHeight / 2 + spacing * 3))
                path.closeSubpath()
            }
            .fill(symbolColorTop)
            
            Path { path in
                path.addLines([
                    CGPoint(x: middle - topWidth, y: topHeight + spacing),
                    CGPoint(x: spacing, y: height - spacing),
                    CGPoint(x: width - spacing, y: height - spacing),
                    CGPoint(x: middle + topWidth, y: topHeight + spacing),
                    CGPoint(x: middle, y: topHeight / 2 + spacing * 3)
                ])
            }
            .fill(symbolColorBottom)
        }
    }
}

#Preview {
    BadgeSymbol()
}

//.fill(.radialGradient(
//    Gradient(colors: [.white, symbolColor]),
//    center: .top,
//    startRadius: 0,
//    endRadius: 0))
