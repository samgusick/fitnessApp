//
//  CalendarView.swift
//  fitnessApp
//
//  Created by Liam Hackett on 10/24/22.
//

import SwiftUI

struct CalendarView: View {
    @State private var date = Date()
    
    @State var sunday : String = "Off Day"
    @State var monday : String = "Push Day"
    @State var tuesday : String = "Pull Day"
    @State var wednesday : String = "Leg Day"
    @State var thursday : String = "Push Day"
    @State var friday : String = "Pull Day"
    @State var saturday : String = "Off Day"
    
    @State var switchWindows : Bool = false
    
    var body: some View {
       
        NavigationView {
            
            VStack{
                
                DatePicker("", selection: $date, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .colorScheme(.light)
                    .background(Rectangle().fill(Color(red: 0.671, green: 0.78, blue: 0.9)).cornerRadius(15))
                    .padding(10)
                
                if Calendar.current.component(.weekday, from: date) == 1 { // Sunday
                    Button{
                        
                    } label:{
                        WorkoutButtonView(label: sunday)
                    }
                    
                }
                else if Calendar.current.component(.weekday, from: date) == 2 { // Monday
                    Button{
                       
                    } label:{
                        WorkoutButtonView(label: monday)
                    }
                    
                }
                else if Calendar.current.component(.weekday, from: date) == 3 { // Tuesday
                    Button{
                        
                    } label:{
                        WorkoutButtonView(label: tuesday)
                    }
                    
                }
                else if Calendar.current.component(.weekday, from: date) == 4 { // Wednesday
                    Button{
                        
                    } label:{
                        WorkoutButtonView(label: wednesday)
                    }
                    
                }
                else if Calendar.current.component(.weekday, from: date) == 5 { // Thursday
                    Button{
                        
                    } label:{
                        WorkoutButtonView(label: thursday)
                    }
                    
                }
                else if Calendar.current.component(.weekday, from: date) == 6 { // Friday
                    Button{
                       
                    } label:{
                        WorkoutButtonView(label: friday)
                    }
                    
                }
                else if Calendar.current.component(.weekday, from: date) == 7 { // Saturday
                    Button{
                       
                    } label:{
                        WorkoutButtonView(label: saturday)
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
        CalendarView()
    }
}
