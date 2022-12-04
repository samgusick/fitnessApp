//
//  fitnessAppApp.swift
//  fitnessApp
//
//  Created by Sam Gusick on 10/18/22.
//

import SwiftUI
import Firebase


@main


struct fitnessAppApp: App {
    
    @StateObject var viewRouter = ViewRouter()
        
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MotherView().environmentObject(viewRouter)
        }
    }
}
