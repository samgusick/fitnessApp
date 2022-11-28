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
    @ObservedObject var settings: Settings = Settings()
    var body: some View {
        TabView(selection: $selected) {
            HomeView(settings: settings)
                .tag(0)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            //DataView(clickedBack: $clickedBack, title: " Weekly Steps", barColor: .darkRed, data: steps)
            CalendarView(settings: settings)
                .tag(1)
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Calendar")
                }
            WorkoutsView(settings: settings)
                .tag(2)
                .tabItem {
                    Image(systemName: "figure.walk")
                    Text("Workouts")
                }
            SettingsView(settings: settings)
                .tag(3)
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
    }
}

