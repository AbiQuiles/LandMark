//
//  ProfileSummary.swift
//  LandMark
//
//  Created by Abiezer Quiles on 12/8/24.
//

import SwiftUI

struct ProfileSummary: View {
    @Environment(ModelData.self) var modelData
    var profile: Profile
    
    var body: some View {
        let name = profile.username
        let notificationPref = profile.prefersNotifications
        let sesonalImage = profile.seasonalPhoto.rawValue
        let goalDate = profile.goalDate
        
        ScrollView() {
            VStack(alignment: .leading, spacing: 10) {
                Text(name)
                    .font(.title)
                    .bold()
                Text("Notification: \(notificationPref ? "On": "Off")")
                Text("Seasonal Photo: \(sesonalImage)")
                Text("Goal Date: ") + Text(goalDate, style: Text.DateStyle.date)
                
                Divider()
                
                CompletedHikeBages()
                
                Divider()
                
                RecentHikes(hikes: modelData.hikes)
                
            }
        }.padding()
    }
}

struct CompletedHikeBages: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Completed Badges")
                .font(.headline)
            
            ScrollView(.horizontal) {
                HStack {
                    HikeBadge(name: "First Hike")
                    HikeBadge(name: "Earth Day")
                        .hueRotation(Angle(degrees: 900))
                    HikeBadge(name: "Tenth Hike")
                        //.grayscale(0.5)
                        .hueRotation(Angle(degrees: 1745))
                }
                .padding(.bottom)
            }
        }
    }
}

struct RecentHikes: View {
    var hikes: [Hike]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Recent Hikes")
                .font(.headline)
            
            
            HikeView(hike: hikes[0])
        }
    }
}

#Preview {
    ProfileSummary(profile: Profile.default)
        .environment(ModelData())
}
