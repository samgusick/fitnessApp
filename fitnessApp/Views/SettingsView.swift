//
//  SettingsView.swift
//  fitnessApp
//
//  Created by Liam Hackett on 10/24/22.
//

import SwiftUI

struct SettingsView: View {
    @State var str : String = ""
    var body: some View {
        
        NavigationView {
            VStack{
                TextField("Username: ", text: $str).background(Rectangle().fill(.white))
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
