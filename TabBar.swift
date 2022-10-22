//
//  TabBar.swift
//  WalkingTabBar
//
//  Created by Max Heath on 10/20/22.
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
            ContentView()
                .tag(0)
                .tabItem {
                    Text("Content")
                }
            HomeView()
                .tag(1)
                .tabItem {
                    Text("Home")
                }
            DataView()
                .tag(2)
                .tabItem {
                    Text("Data")
                }
            DatabaseView()
                .tag(3)
                .tabItem {
                    Text("Database")
                }
        }
    }
}
