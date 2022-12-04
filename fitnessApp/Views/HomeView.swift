//
//  HomeView.swift
//  fitnessApp
//
//  Created by Liam Hackett on 10/20/22.
//

import SwiftUI
import HealthKit
import Firebase


struct Step: Identifiable {
    let id = UUID()
    let count: Int
    let date: Date
    let label : String
}

struct HomeView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter

    private var healthStore: HealthStore?
    @State var steps: [Step] = [Step]()
    @State var stepCount: Int
    @State var progress : CGFloat
    var goal: CGFloat // add option for user input in settings / when creating account
    @State var switchWindowSteps : Bool
    @ObservedObject var timer : TimerKit
    @State var calorieCount: Int
    @ObservedObject var settings: Settings //= Settings()
    
    init(settings : Settings) {
        healthStore = HealthStore()
        stepCount = 1
        goal = 5000
        progress = 0.5
        switchWindowSteps = false
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        timer = TimerKit()
        calorieCount = 0
        self.settings = settings
        goal = self.settings.goal
    }
    
    
    func formateDate(date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd"
        return dateFormatter.string(from: date)
    }
    
    private func updateSteps(_ statisticsCollection:  HKStatisticsCollection) {
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
            DataView(clickedBack: $switchWindowSteps, title: " Weekly Steps", barColor: .darkRed, data: steps, settings: settings)
        }
        else{
            ZStack{
                NavigationView{
                    VStack {
                        Text(Date(), style: .date)
                            .foregroundColor(.black)
                            .padding([.leading], 100)
                        HStack {
                            
                            Button {
                                calorieCount+=100
                            } label: {
                                Text("Calories\n\(calorieCount)")
                                    .fixedSize(horizontal: false, vertical: true)
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.center)
                                    .frame(width: 150, height: 150)
                                    .background(Rectangle().fill(settings.accentColor)
                                        .cornerRadius(10))
                                Button{
                                    calorieCount = 0
                                }
                                label: {
                                    Image(systemName: "gobackward")
                                        .foregroundColor(.black)
                                }
                                .offset(x: -50, y: 50)
                            }
                                
                            Button {
                                switchWindowSteps = true

                            } label: {
                                Text( "\(stepCount)\nSteps")
                                    .fixedSize(horizontal: false, vertical: true)
                                    .frame(width: 150, height: 150)
                                    .multilineTextAlignment(.leading)
                                    .background(Rectangle().fill(settings.accentColor)
                                        .cornerRadius(10))

                                    .foregroundColor(.darkRed)
                                Image(systemName: "figure.walk.circle").offset(x: -50, y: -50).foregroundColor(.darkRed)

                            }
                        
                        }
                        .padding([.leading], 40)

                        ProgressRingView(progress: $progress, goal: goal)
                            .padding([.top], 20)
                           
                        TimerButtonView(accentColor: $settings.accentColor)
                            .padding([.top], 15)
                        
                    }
                    .navigationBarTitle(Text("FitTrack"))
                    .navigationBarItems(leading: Image(systemName: "figure.walk").foregroundColor(.black))//systemName: "figure.run")) not available ios 15
                    .font(.title)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(red: 0.4, green: 0.6, blue: 0.8).edgesIgnoringSafeArea(.all))
                }
                .onAppear {
                    updateAppearance()
                }
               
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(settings: Settings())
    }
}
