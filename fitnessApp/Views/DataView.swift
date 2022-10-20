//
//  DataView.swift
//  fitnessApp
//
//  Created by Liam Hackett on 10/18/22.
//

import SwiftUI

struct DataView: View {
    @Binding var clicked : Bool
    var body: some View {
        if clicked{
            
            // Add data view in here
            NavigationView {
                VStack{
                    Button{
                        clicked = false
                    }label:{
                        Text("Home")
                            .frame(width: 100, height: 50)
                            .foregroundColor(.black)
                            .buttonStyle(.bordered)
                            .background(Rectangle().fill(Color(red: 0.671, green: 0.78, blue: 0.9))
                            .shadow(radius: 5)
                            .cornerRadius(10))
                    }
                    
                    
                    
                }
            .navigationBarTitle(Text("Fitness App"))
            .navigationBarItems(leading: Image(systemName: "figure.walk").foregroundColor(.black))//systemName: "figure.run")) not available ios 15
            .font(.title)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.4, green: 0.6, blue: 0.8).edgesIgnoringSafeArea(.all))
            }
        }
        else{
            HomeView()
        }
    }
}

//struct DataView_Previews: PreviewProvider {
//    static var previews: some View {
//
//        DataView()
//    }
//}
