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
//    @Binding var clickedBack : Bool
    @State private var selected: Tab = .home
//    var steps : [Step]
    
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
//            DataView(clickedBack: $clickedBack, title: " Weekly Steps", barColor: .darkRed, data: steps)
//
//                .tag(2)
//                .tabItem {
//                    Text("Data")
//                }
//            DatabaseView()
//                .tag(3)
//                .tabItem {
//                    Text("Database")
//                }
        }
    }
}
