//
//  CalendarView.swift
//  fitnessApp
//
//  Created by Liam Hackett on 10/24/22.
//

import SwiftUI

struct CalendarView: View {
    var body: some View {
        NavigationView {
            VStack{
            }
            .navigationBarTitle(Text("Calendar"))
            .navigationBarItems(leading: Image(systemName: "calendar").foregroundColor(.black))//systemName: "figure.run")) not available ios 15
            .font(.title)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.4, green: 0.6, blue: 0.8).edgesIgnoringSafeArea(.all))
        }
        
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
