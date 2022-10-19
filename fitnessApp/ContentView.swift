//
//  ContentView.swift
//  fitnessApp
//
//  Created by Sam Gusick on 10/18/22.
//

import SwiftUI
import HealthKit
import Foundation

struct Step: Identifiable {
    let id = UUID()
    let count: Int
    let date: Date
}

struct ContentView: View {
    private var healthStore: HealthStore?
    @State private var steps: [Step] = [Step]()
    @State var stepCount: Int
    @State var progress : CGFloat
    private var goal: CGFloat
   
    init() {
        healthStore = HealthStore()
        stepCount = 1
        goal = 5000
        progress = 0.5
    }
    
    private func updateStepsUI(_ statisticsCollection:  HKStatisticsCollection) {
        
        // Change value to get different number of days worth of steps
        let startDate = Calendar.current.date(byAdding: .day, value: 0, to: Date())!
        let endDate = Date()
        
        statisticsCollection.enumerateStatistics(from: startDate, to: endDate) { (stats, stop) in
            
            let count = stats.sumQuantity()?.doubleValue(for: .count())
            let step = Step(count: Int(count ?? 0), date: stats.startDate)
            steps.append(step)
            stepCount = step.count
            progress = CGFloat( stepCount )
        }
        
    }
    
    var body: some View {
        ZStack{
            NavigationView{
                VStack (alignment: .trailing) {
                    
                    Text(Date(), style: .date)
                        .padding(10)
                        .offset(y: -260)
                
                    HStack (alignment: .lastTextBaseline){
                        //Text("Fitness App")
                        //.font(.title)
                        //.padding()
                        Text("Timer\n0:00")
                            .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(width: 150, height: 150)
                            .background(Rectangle().fill(Color(red: 0.671, green: 0.78, blue: 0.9))
                                .shadow(radius: 3)
                                .cornerRadius(10))
                            .offset(y: -275)
                            .padding(10)
                        
                        Text("\(stepCount)\nSteps")
                            .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.leading)
                            .padding()
                            .frame(width: 150, height: 150)
                            .background(Rectangle().fill(Color(red: 0.671, green: 0.78, blue: 0.9))
                                .shadow(radius: 3)
                                .cornerRadius(10))
                            .offset(y: -275)
                            .padding(10)
                        
                    }
    
                    
                    
                }
                .navigationTitle("Fitness App")
                .font(.title)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                .background(Color(red: 0.39, green: 0.46, blue: 0.7))
//                .cornerRadius(10)
//                .padding(10)
                .background(Color(red: 0.4, green: 0.6, blue: 0.8).edgesIgnoringSafeArea(.all))
                
                
            }
            .onAppear {
                if let healthStore = healthStore {
                    healthStore.requestAuthorization { success in
                        if success {
                            healthStore.calculateSteps { statisticsCollection in
                                if let statisticsCollection = statisticsCollection {
                                    // update the UI
                                    updateStepsUI(statisticsCollection)
                                }
                            }
                        }
                    }
                }
            }
            ProgressRingView(progress : $progress, goal: goal)
                .offset(y: -100)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
