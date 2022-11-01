//
//  CalendarView.swift
//  fitnessApp
//
//  Created by Liam Hackett on 10/24/22.
//

import SwiftUI

struct CalendarView: View {
    @State private var date = Date()
    var body: some View {
        NavigationView {
            VStack{
                DatePicker("", selection: $date, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .colorScheme(.light)
                    //.foregroundColor(.black)
                    //.accentColor(.black)
                    .frame(maxHeight: 400)
//                    .offset(y: -125)
                    .fixedSize(horizontal: false, vertical: true)
                    .background(Rectangle().fill(Color(red: 0.671, green: 0.78, blue: 0.9)).cornerRadius(15))
                    .padding(10)
                    .offset(y: -100)
                
                if Calendar.current.component(.weekday, from: date) == 1 { // Sunday
                    Text("Off Day").foregroundColor(.black)
                }
                else if Calendar.current.component(.weekday, from: date) == 2 { // Monday
                    Text("Push Day").foregroundColor(.black)
                }
                else if Calendar.current.component(.weekday, from: date) == 3 { // Tuesday
                    Text("Pull Day").foregroundColor(.black)
                }
                else if Calendar.current.component(.weekday, from: date) == 4 { // Wednesday
                    Text("Leg Day").foregroundColor(.black)
                }
                else if Calendar.current.component(.weekday, from: date) == 5 { // Thursday
                    Text("Push Day").foregroundColor(.black)
                }
                else if Calendar.current.component(.weekday, from: date) == 6 { // Friday
                    Text("Pull Day").foregroundColor(.black)
                }
                else if Calendar.current.component(.weekday, from: date) == 7 { // Saturday
                    Text("Off Day").foregroundColor(.black)
                }
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
