//
//  ProfileEditor.swift
//  LandMark
//
//  Created by Abiezer Quiles on 12/9/24.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    
    var body: some View {
        var dateRange: ClosedRange<Date> {
            let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
            let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
            return min...max
        }
        
        List {
            HStack {
                Text("Username")
                
                Spacer()
                
                TextField("Username",text: $profile.username)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.trailing)
            }
            
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications")
            }
            
            Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                ForEach(Profile.Season.allCases) { season in
                    Text(season.rawValue).tag(season)
                }
            }
            
            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
                Text("Goal Date")
            }
        }.cornerRadius(10)
    }
}

struct DebugButton: View {
    var object: Any
    
    var body: some View {
        Button("Console Print") {
            print(object)
        }
    }
}

#Preview {
    ProfileEditor(
        profile: .constant(.default)
    )
}
