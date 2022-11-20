//
//  SettingsView.swift
//  fitnessApp
//
//  Created by Liam Hackett on 10/24/22.
//

import SwiftUI
import Firebase

struct SettingsView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
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
            Text("HomeView")
                    .navigationTitle("V24")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Sign Out") {
                                signOutUser()
                            }
                        }
                    }
            
            
        }
    }
    
    
    func signOutUser() {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
        withAnimation {
            viewRouter.currentPage = .signInPage
        }
    }
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
