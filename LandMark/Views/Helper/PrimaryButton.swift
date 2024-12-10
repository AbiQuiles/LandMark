//
//  PrimaryButton.swift
//  LandMark
//
//  Created by Abiezer Quiles on 12/9/24.
//

import SwiftUI

struct PrimaryButton: View {
    let text: String
    var textColor: Color = Color.primary
    var image: Image?
    var background: Color?
    let action: () -> Void
    
    var body: some View {
        
        HStack() {
            Button {
                action()
            } label: {
                image
                Text(text)
                    .fontWeight(.bold)
                    .foregroundStyle(textColor)
                    .padding(10)
            }
            .background(background)
            .cornerRadius(10)
        }
    }
}

#Preview {
    PrimaryButton(
        text: "Primary Button",
        action: {print("Tap fro Primary Button")}
    )
}
