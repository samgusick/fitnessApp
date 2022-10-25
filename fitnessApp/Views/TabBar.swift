//
//  TabBar.swift
//  fitnessApp
//
//  Created by Liam Hackett on 10/22/22.
//

import SwiftUI

enum Tab: Hashable {
    case home
    case calendar
    case workout
    case settings
}

struct TabBar: View {
    @State private var selected: Tab = .home
    
    var body: some View {
        TabView(selection: $selected) {
            HomeView()
                .tag(0)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            //DataView(clickedBack: $clickedBack, title: " Weekly Steps", barColor: .darkRed, data: steps)
            CalendarView()
                .tag(1)
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Calendar")
                }
            WorkoutsView()
                .tag(3)
                .tabItem {
                    Image(systemName: "figure.walk")
                    Text("Workouts")
                }
            SettingsView()
                .tag(3)
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
    }
}

