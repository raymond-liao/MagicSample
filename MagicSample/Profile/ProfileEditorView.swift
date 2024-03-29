//
//  ProfileEditorView.swift
//  MagicSample
//
//  Created by raniys on 10/15/19.
//  Copyright © 2019 raniys. All rights reserved.
//

import SwiftUI

struct ProfileEditorView: View {
    @Binding var profile: Profile
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    var body: some View {
        List {
            
            HStack {
                Text("UserName").bold()
                Divider()
                TextField("UserName", text: $profile.username)
            }
            
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications")
            }
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Seasonal Photo").bold()
                
                Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases, id: \.self) { season in
                        Text(season.rawValue).tag(season)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            
            }
            .padding(.top)
            
            VStack {
                Text("Goal Date").bold()
                
                DatePicker("Goal Date", selection: $profile.goalDate, in: dateRange, displayedComponents: .date)
            }
            .padding(.top)
        }
    }
}

struct ProfileEditorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditorView(profile: .constant(.default))
    }
}
