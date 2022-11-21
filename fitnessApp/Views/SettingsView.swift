//
//  SettingsView.swift
//  fitnessApp
//
//  Created by Liam Hackett on 10/24/22.
//
import Foundation
import SwiftUI

struct SettingsView: View {
    @State var str : String = ""
    @ObservedObject var settings: Settings = Settings()
    var body: some View {
        
        NavigationView {
            VStack{
                TextField("Username: ", text: $str)
                    .frame(width:300)
                    .background(Rectangle().fill(settings.accentColor))
                Menu {
                    Button("Blue", action: {
                        settings.changeColor(accent: Color(red: 0.671, green: 0.78, blue: 0.9), background: Color(red: 0.4, green: 0.6, blue: 0.8))
                        
                    });
                    Button("Pink", action: {
                        settings.changeColor(accent: Color(red: 0.9, green: 0.671, blue: 0.78), background: Color(red: 0.8, green: 0.4, blue: 0.6))
                        
                    })
                    Button("Green", action: {
                        settings.changeColor(accent: Color(red: 0.671, green: 0.9, blue: 0.78), background: Color(red: 0.4, green: 0.8, blue: 0.6))
                        
                    })
                } label: {
                    Text("Background Color")
                    .foregroundColor(.black)
                    .frame(width: 300, height: 100)
                    .background(Rectangle().fill(settings.accentColor)
                        .cornerRadius(10))
                }
                
                /*
                .navigationBarTitle(Text("Settings"))
                .navigationBarItems(leading: Image(systemName: "gear").foregroundColor(.black))//systemName: "figure.run")) not available ios 15
                .font(.title)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Rectangle().fill(settings.backgroundColor)).edgesIgnoringSafeArea(.all)*/
            }.navigationBarTitle(Text("Settings"))
                .navigationBarItems(leading: Image(systemName: "gear").foregroundColor(.black))//systemName: "figure.run")) not available ios 15
                .font(.title)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Rectangle().fill(settings.backgroundColor).edgesIgnoringSafeArea(.all))
        }
    }
    
    struct SettingsView_Previews: PreviewProvider {
        static var previews: some View {
            SettingsView()
        }
    }
}
