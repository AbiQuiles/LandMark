//
//  FavoriteButton.swift
//  LandMark
//
//  Created by Abiezer Quiles on 11/11/24.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isFavorite: Bool
    
    var body: some View {
        Button {
            isFavorite.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isFavorite ? "star.fill" : "star")
                .font(.system(size: 20))
                .labelStyle(.iconOnly)
                .foregroundStyle(isFavorite ? .yellow : .gray)
        }
    }
}

#Preview {
    FavoriteButton(isFavorite: .constant(false))
}
