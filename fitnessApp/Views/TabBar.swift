//
//  TabBar.swift
//  fitnessApp
//
//  Created by Liam Hackett on 10/22/22.
//

import SwiftUI

struct TabBar: View {
    private enum Tab: Hashable {
        case home
        case content
        case data
        case database
    }

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
            //Bar(value: 3800, color: .blue)
            CalendarView()
                .tag(1)
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Calendar")
                }
            SettingsView()
                .tag(2)
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
    }
}
