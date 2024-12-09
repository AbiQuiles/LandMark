//
//  ProfileButton.swift
//  LandMark
//
//  Created by Abiezer Quiles on 12/9/24.
//

import SwiftUI

struct ProfileButton: View {
    @Binding var navigate: Bool
    
    var body: some View {
        Button {
            navigate.toggle()
        } label: {
            Label(
                "Profile Button",
                systemImage: "person.circle"
            )
        }
    }
}

#Preview {
    ProfileButton(navigate: .constant(false))
}
