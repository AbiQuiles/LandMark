//
//  ProfileHost.swift
//  LandMark
//
//  Created by Abiezer Quiles on 12/8/24.
//

import SwiftUI

struct ProfileHost: View {
    @State private var draftProfile = Profile.default
    
    var body: some View {
        ProfileSummary(profile: draftProfile)
    }
}

#Preview {
    ProfileHost()
        .environment(ModelData())
}
