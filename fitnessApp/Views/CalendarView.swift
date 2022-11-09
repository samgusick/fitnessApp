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
                    //.fixedSize(horizontal: false, vertical: true)
                    .background(Rectangle().fill(Color(red: 0.671, green: 0.78, blue: 0.9)).cornerRadius(15))
                    .padding(10)
                    //.offset(y: -100)
                
                
                // NOTE : CLEAN UP CODE - Create a variable that changes in the if else chain (maybe use a switch statement) and have the text outside the chain
                
                if Calendar.current.component(.weekday, from: date) == 1 { // Sunday
                    Text("Off Day")
                        .foregroundColor(.black)
                        .frame(width: 150, height: 50)
                        .background(Rectangle().fill(Color(red: 0.671, green: 0.78, blue: 0.9)).cornerRadius(15))
                        .padding(10)
                        
                }
                else if Calendar.current.component(.weekday, from: date) == 2 { // Monday
                    Text("Push Day")
                        .foregroundColor(.black)
                        .frame(width: 150, height: 50)
                        .background(Rectangle().fill(Color(red: 0.671, green: 0.78, blue: 0.9)).cornerRadius(15))
                        .padding(10)
                        
                }
                else if Calendar.current.component(.weekday, from: date) == 3 { // Tuesday
                    Text("Pull Day")
                        .foregroundColor(.black)
                        .frame(width: 150, height: 50)
                        .background(Rectangle().fill(Color(red: 0.671, green: 0.78, blue: 0.9)).cornerRadius(15))
                        .padding(10)
                        
                }
                else if Calendar.current.component(.weekday, from: date) == 4 { // Wednesday
                    Text("Leg Day")
                        .foregroundColor(.black)
                        .frame(width: 400, height: 50)
                        .background(Rectangle().fill(Color(red: 0.671, green: 0.78, blue: 0.9)).cornerRadius(15))
                        .padding(.bottom, 10)
                        
                }
                else if Calendar.current.component(.weekday, from: date) == 5 { // Thursday
                    Text("Push Day")
                        .foregroundColor(.black)
                        .frame(width: 150, height: 50)
                        .background(Rectangle().fill(Color(red: 0.671, green: 0.78, blue: 0.9)).cornerRadius(15))
                        .padding(10)
                        
                }
                else if Calendar.current.component(.weekday, from: date) == 6 { // Friday
                    Text("Pull Day")
                        .foregroundColor(.black)
                        .frame(width: 150, height: 50)
                        .background(Rectangle().fill(Color(red: 0.671, green: 0.78, blue: 0.9)).cornerRadius(15))
                        .padding(10)
                        
                }
                else if Calendar.current.component(.weekday, from: date) == 7 { // Saturday
                    Text("Off Day")
                        .foregroundColor(.black)
                        .frame(width: 150, height: 50)
                        .background(Rectangle().fill(Color(red: 0.671, green: 0.78, blue: 0.9)).cornerRadius(15))
                        .padding(10)
                        
                }
               
                ZStack{
                    Rectangle().fill(Color(red: 0.671, green: 0.78, blue: 0.9))
                        .cornerRadius(15)
                        .frame(width: 400, height: 200)
                        .offset(y: -15)
                        .padding(15)
                    VStack{
                        Text("Test: This is an example").padding(EdgeInsets(top: 0, leading: 0, bottom: 100, trailing: 75))
                        Text("")
                        Text("")
                        Text("")
                    }
                    .padding(10)
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
