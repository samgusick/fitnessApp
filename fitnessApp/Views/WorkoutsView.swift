//
//  WorkoutsView.swift
//  fitnessApp
//
//  Created by Liam Hackett on 10/25/22.
//

import SwiftUI

struct WorkoutsView: View {
    var body: some View {
        NavigationView {
            VStack{
            }
            .navigationBarTitle(Text("Workouts"))
            .navigationBarItems(leading: Image(systemName: "figure.walk").foregroundColor(.black))//systemName: "figure.run")) not available ios 15
            .font(.title)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.4, green: 0.6, blue: 0.8).edgesIgnoringSafeArea(.all))
        }    }
}

struct WorkoutsView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutsView()
    }
}
