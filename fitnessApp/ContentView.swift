//
//  ContentView.swift
//  fitnessApp
//
//  Created by Sam Gusick on 10/18/22.
//

import SwiftUI
import HealthKit
import Foundation


struct ContentView: View {
    var body: some View {
        //HomeView()
        //TabBar()
        MotherView().environmentObject(ViewRouter())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
