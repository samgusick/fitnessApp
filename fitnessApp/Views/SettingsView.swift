//
//  SettingsView.swift
//  fitnessApp
//
//  Created by Liam Hackett on 10/24/22.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        
        NavigationView {
            VStack{
            }
            .navigationBarTitle(Text("Settings"))
            .navigationBarItems(leading: Image(systemName: "gear").foregroundColor(.black))//systemName: "figure.run")) not available ios 15
            .font(.title)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.4, green: 0.6, blue: 0.8).edgesIgnoringSafeArea(.all))
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
