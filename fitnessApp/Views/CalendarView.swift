//
//  CalendarView.swift
//  fitnessApp
//
//  Created by Liam Hackett on 10/24/22.
//

import SwiftUI

struct CalendarView: View {
    @State private var date = Date()
    @State var switchWindows : Bool = false
    @ObservedObject var settings: Settings
    
    var body: some View {
       
        NavigationView {
            
            VStack{
                
                DatePicker("", selection: $date, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .colorScheme(.light)
                    .background(Rectangle().fill(settings.accentColor).cornerRadius(15))
                    .padding(10)
                
                if Calendar.current.component(.weekday, from: date) == 1 { // Sunday
                    Button{
                        
                    } label:{
                        WorkoutButtonView(label: settings.sunday, settings: settings)
                    }
                    
                }
                else if Calendar.current.component(.weekday, from: date) == 2 { // Monday
                    Button{
                       
                    } label:{
                        WorkoutButtonView(label: settings.monday, settings: settings)
                    }
                    
                }
                else if Calendar.current.component(.weekday, from: date) == 3 { // Tuesday
                    Button{
                        
                    } label:{
                        WorkoutButtonView(label: settings.tuesday, settings: settings)
                    }
                    
                }
                else if Calendar.current.component(.weekday, from: date) == 4 { // Wednesday
                    Button{
                        
                    } label:{
                        WorkoutButtonView(label: settings.wednesday, settings: settings)
                    }
                    
                }
                else if Calendar.current.component(.weekday, from: date) == 5 { // Thursday
                    Button{
                        
                    } label:{
                        WorkoutButtonView(label: settings.thursday, settings: settings)
                    }
                    
                }
                else if Calendar.current.component(.weekday, from: date) == 6 { // Friday
                    Button{
                       
                    } label:{
                        WorkoutButtonView(label: settings.friday,settings: settings)
                    }
                    
                }
                else if Calendar.current.component(.weekday, from: date) == 7 { // Saturday
                    Button{
                       
                    } label:{
                        WorkoutButtonView(label: settings.saturday, settings: settings)
                    }
                    
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
        CalendarView(settings: Settings())
    }
}
