//
//  HomeView.swift
//  fitnessApp
//
//  Created by Liam Hackett on 10/20/22.
//

import SwiftUI
import HealthKit

struct Step: Identifiable {
    let id = UUID()
    let count: Int
    let date: Date
}

struct HomeView: View {
    private var healthStore: HealthStore?
    @State private var steps: [Step] = [Step]()
    @State var stepCount: Int
    @State var progress : CGFloat
    private var goal: CGFloat // add option for user input in settings / when creating account
    
    @State var switchWindowSteps : Bool
    
    
    init() {
        healthStore = HealthStore()
        stepCount = 1
        goal = 5000
        progress = 0.5
        switchWindowSteps = false
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.black]
    }

    private func updateSteps(_ statisticsCollection:  HKStatisticsCollection) {

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

    private func updateAppearance(){
        if let healthStore = healthStore {
            healthStore.requestAuthorization { success in
                if success {
                    healthStore.calculateSteps { statisticsCollection in
                        if let statisticsCollection = statisticsCollection {
                            // update the UI
                            updateSteps(statisticsCollection)
                        }
                    }
                }
            }
        }
    }

    var body: some View {
        if switchWindowSteps {
            DataView(clicked: $switchWindowSteps)
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
                            //Text("Fitness App")
                            //.font(.title)
                            //.padding()
                            Text("Timer\n0:00")
                                .fixedSize(horizontal: false, vertical: true)
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                                .frame(width: 150, height: 150)
                                .background(Rectangle().fill(Color(red: 0.671, green: 0.78, blue: 0.9))
                                    .shadow(radius: 3)
                                    .cornerRadius(10))
                                .padding(35)
                                .offset(y: -15)
                            Button {
                                // random example functionality eventually going to take user to a new window
//                                stepCount+=1
//                                progress = CGFloat( stepCount )
                                
                                switchWindowSteps = true
                                
                            } label: {
                                Text( "\(stepCount)\nSteps")
                                    .fixedSize(horizontal: false, vertical: true)
                                    .frame(width: 150, height: 150)
                                    .multilineTextAlignment(.leading)
                                    .padding(0)
                                    .background(Rectangle().fill(Color(red: 0.671, green: 0.78, blue: 0.9))
                                        .shadow(radius: 3)
                                        .cornerRadius(10))
                                
                                    .foregroundColor(.darkRed)
                                Image(systemName: "figure.walk.circle").offset(x: -50, y: -50).foregroundColor(.darkRed)
                                
                            }
                            .offset(y: -15)
                            .position(x: 100, y: 90)
                            
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
                    .offset(y: -50)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
