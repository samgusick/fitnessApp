//
//  HomeView.swift
//  fitnessApp
//
//  Created by Liam Hackett on 10/20/22.
//

import SwiftUI
import HealthKit

// NOTE PUT BUTTONS INTO THEIR OWN VIEWS

struct Step: Identifiable {
    let id = UUID()
    let count: Int
    let date: Date
    let label : String
}

struct HomeView: View {
    private var healthStore: HealthStore?
    @State var steps: [Step] = [Step]()
    @State var stepCount: Int
    @State var progress : CGFloat
    private var goal: CGFloat // add option for user input in settings / when creating account
    @State var switchWindowSteps : Bool
    @ObservedObject var timer : TimerKit
    
    init() {
        healthStore = HealthStore()
        stepCount = 1
        goal = 5000
        progress = 0.5
        switchWindowSteps = false
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        timer = TimerKit()
    }
    
    func formateDate(date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd"
        return dateFormatter.string(from: date)
    }
    
    private func updateSteps(_ statisticsCollection:  HKStatisticsCollection) {
        // Change value to get different number of days worth of steps
        let startDate = Calendar.current.date(byAdding: .day, value: -6, to: Date())!
        let endDate = Date()
        steps.removeAll()
        statisticsCollection.enumerateStatistics(from: startDate, to: endDate) { (stats, stop) in

            let count = stats.sumQuantity()?.doubleValue(for: .count())
            let step = Step(count: Int(count ?? 0), date: stats.startDate, label: formateDate(date: stats.startDate))
            steps.append(step)
            stepCount = step.count
            progress = CGFloat( stepCount )
        }
    }

    private func updateAppearance(){
        if let healthStore = healthStore {
            healthStore.requestAuthorization { success in
                if success {
                    healthStore.calculateSteps { statisticsCollection in
                        if let statisticsCollection = statisticsCollection {
                            updateSteps(statisticsCollection)
                        }
                    }
                }
            }
        }
    }

    var body: some View {
        if switchWindowSteps {
            DataView(clickedBack: $switchWindowSteps, title: " Weekly Steps", barColor: .darkRed, data: steps)
        }
        else{
            ZStack{
                NavigationView{
                    VStack (alignment: .trailing) {
                        
                        Text(Date(), style: .date)
                            .padding(10)
                            .offset(y: 20)
                            .foregroundColor(.black)
                        
                        HStack (alignment: .lastTextBaseline){
                            Button {
                            } label: {
                                Text("Calender\n")
                                    .fixedSize(horizontal: false, vertical: true)
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.center)
                                    .frame(width: 150, height: 150)
                                    //.frame(width : UIScreen.main.bounds.width / 3, height : UIScreen.main.bounds.height / 6  )
                                    .background(Rectangle().fill(Color(red: 0.671, green: 0.78, blue: 0.9))
                                        .shadow(radius: 3)
                                        .cornerRadius(10))
                            }
                            .position(x : UIScreen.main.bounds.width / 4, y: UIScreen.main.bounds.height / 10 )
                            .padding(15)
                            //.offset(y: -15)
                            
                            
                            Button {
                                switchWindowSteps = true
                                
                            } label: {
                                Text( "\(stepCount)\nSteps")
                                    .fixedSize(horizontal: false, vertical: true)
                                    .frame(width: 150, height: 150)
                                    //.frame(width : UIScreen.main.bounds.width / 3, height : UIScreen.main.bounds.height / 6  )
                                    .multilineTextAlignment(.leading)
                                    .padding(0)
                                    .background(Rectangle().fill(Color(red: 0.671, green: 0.78, blue: 0.9))
                                        .shadow(radius: 3)
                                        .cornerRadius(10))
                                
                                    .foregroundColor(.darkRed)
                                Image(systemName: "figure.walk.circle").offset(x: -50, y: -50).foregroundColor(.darkRed)
                                
                            }
                            //.offset(y: -15)
                            //.position(x: 100, y: 90)
                            .position(x : UIScreen.main.bounds.width / 4, y: UIScreen.main.bounds.height / 10 )
                            
                            .contextMenu{
                                Text("\(stepCount) Steps")
                            }
                            
                        }
                        .padding(10)
                        ZStack{
                            Text(timer.label)
                                .monospacedDigit()
                                .fixedSize(horizontal: false, vertical: true)
                                .frame(width: 350, height: 100)
                                .multilineTextAlignment(.leading)
                                .padding(0)
                                .background(Rectangle().fill(Color(red: 0.671, green: 0.78, blue: 0.9))
                                    .shadow(radius: 3)
                                    .cornerRadius(10))
                                .foregroundColor(.black)
                                .offset(x: -40, y: -90)
                            
                            if timer.mode == .stopped {
                                Button{
                                    timer.start()
                                } label: {
                                    TimerView(label: "play.fill", buttonColor: .black)
                                }.offset(x: -125, y: -90)
                            }
                            if timer.mode == .running {
                                Button{
                                    timer.pause()
                                } label: {
                                    TimerView(label: "pause.fill", buttonColor: .black)
                                }.offset(x: -125, y: -90)
                                Button{
                                    timer.reset()
                                } label: {
                                    Image(systemName: "stop.fill")
                                        .foregroundColor(.black)
                                }.offset(x: -165, y: -90)
                            }
                            if timer.mode == .paused {
                                Button{
                                    timer.start()
                                } label: {
                                    TimerView(label: "play.fill", buttonColor: .black)
                                }.offset(x: -125, y: -90)
                                Button{
                                    timer.reset()
                                } label: {
                                    Image(systemName: "gobackward")
                                        .foregroundColor(.black)
                                }.offset(x: -165, y: -90)
                            }
                            
                            Image(systemName: "stopwatch").offset(x: 45, y: -90)
                                .foregroundColor(.black)
                            
                        }
                    }
                    .navigationBarTitle(Text("Fitness App"))
                    .navigationBarItems(leading: Image(systemName: "figure.walk").foregroundColor(.black))//systemName: "figure.run")) not available ios 15
                    .font(.title)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(red: 0.4, green: 0.6, blue: 0.8).edgesIgnoringSafeArea(.all))
                }
                .onAppear {
                    updateAppearance()
                }
                ProgressRingView(progress : $progress, goal: goal)
                    .offset(y: -80)
                    //.scaleEffect(x: 0.9, y: 0.9)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
