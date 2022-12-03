//
//  SettingsView.swift
//  fitnessApp
//
//  Created by Liam Hackett on 10/24/22.
//
import Foundation
import SwiftUI
import Firebase

struct SettingsView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State var str : String = ""
    @ObservedObject var settings: Settings
    var body: some View {
        VStack {
            Menu("Schedule") {
                Menu("Sunday") {
                    Button("Push Day", action: {
                        settings.changeDay(day: &settings.sunday, workout: "Push Day")
                    })
                    Button("Pull Day", action: {
                        settings.changeDay(day: &settings.sunday, workout: "Pull Day")
                    })
                    Button("Leg Day", action: {
                        settings.changeDay(day: &settings.sunday, workout: "Leg Day")
                    })
                    Button("Rest Day", action: {
                        settings.changeDay(day: &settings.sunday, workout: "Off Day")
                    })
                }
                Menu("Monday") {
                    Button("Push Day", action: {
                        settings.changeDay(day: &settings.monday, workout: "Push Day")
                    })
                    Button("Pull Day", action: {
                        settings.changeDay(day: &settings.monday, workout: "Pull Day")
                    })
                    Button("Leg Day", action: {
                        settings.changeDay(day: &settings.monday, workout: "Leg Day")
                    })
                    Button("Rest Day", action: {
                        settings.changeDay(day: &settings.monday, workout: "Off Day")
                    })
                }
                Menu("Tuesday") {
                    Button("Push Day", action: {
                        settings.changeDay(day: &settings.tuesday, workout: "Push Day")
                    })
                    Button("Pull Day", action: {
                        settings.changeDay(day: &settings.tuesday, workout: "Pull Day")
                    })
                    Button("Leg Day", action: {
                        settings.changeDay(day: &settings.tuesday, workout: "Leg Day")
                    })
                    Button("Rest Day", action: {
                        settings.changeDay(day: &settings.tuesday, workout: "Off Day")
                    })
                }
                Menu("Wednesday") {
                    Button("Push Day", action: {
                        settings.changeDay(day: &settings.wednesday, workout: "Push Day")
                    })
                    Button("Pull Day", action: {
                        settings.changeDay(day: &settings.wednesday, workout: "Pull Day")
                    })
                    Button("Leg Day", action: {
                        settings.changeDay(day: &settings.wednesday, workout: "Leg Day")
                    })
                    Button("Rest Day", action: {
                        settings.changeDay(day: &settings.wednesday, workout: "Off Day")
                    })
                }
                Menu("Thursday") {
                    Button("Push Day", action: {
                        settings.changeDay(day: &settings.thursday, workout: "Push Day")
                    })
                    Button("Pull Day", action: {
                        settings.changeDay(day: &settings.thursday, workout: "Pull Day")
                    })
                    Button("Leg Day", action: {
                        settings.changeDay(day: &settings.thursday, workout: "Leg Day")
                    })
                    Button("Rest Day", action: {
                        settings.changeDay(day: &settings.thursday, workout: "Off Day")
                    })
                }
                Menu("Friday") {
                    Button("Push Day", action: {
                        settings.changeDay(day: &settings.friday, workout: "Push Day")
                    })
                    Button("Pull Day", action: {
                        settings.changeDay(day: &settings.friday, workout: "Pull Day")
                    })
                    Button("Leg Day", action: {
                        settings.changeDay(day: &settings.friday, workout: "Leg Day")
                    })
                    Button("Rest Day", action: {
                        settings.changeDay(day: &settings.friday, workout: "Off Day")
                    })
                }
                Menu("Saturday") {
                    Button("Push Day", action: {
                        settings.changeDay(day: &settings.saturday, workout: "Push Day")
                    })
                    Button("Pull Day", action: {
                        settings.changeDay(day: &settings.saturday, workout: "Pull Day")
                    })
                    Button("Leg Day", action: {
                        settings.changeDay(day: &settings.saturday, workout: "Leg Day")
                    })
                    Button("Rest Day", action: {
                        settings.changeDay(day: &settings.saturday, workout: "Off Day")
                    })
                }
            }
            .foregroundColor(.black)
                .frame(width: 300, height: 100)
                .background(Rectangle().fill(settings.accentColor)
                    .cornerRadius(10))
            Menu {
                Button("Blue (Default)", action: {
                    settings.changeColor(accent: Color(red: 0.671, green: 0.78, blue: 0.9), background: Color(red: 0.4, green: 0.6, blue: 0.8))
                    
                });
                Button("Pink", action: {
                    settings.changeColor(accent: Color(red: 0.9, green: 0.671, blue: 0.78), background: Color(red: 0.8, green: 0.4, blue: 0.6))
                    
                })
                Button("Green", action: {
                    settings.changeColor(accent: Color(red: 0.671, green: 0.9, blue: 0.78), background: Color(red: 0.4, green: 0.8, blue: 0.6))
                    
                })
            } label: {
                Text("Background Color")
                    .foregroundColor(.black)
                    .frame(width: 300, height: 100)
                    .background(Rectangle().fill(settings.accentColor)
                        .cornerRadius(10))
            }
            Button{
                signOutUser()
            } label: {
                Text("Sign Out")
                    .foregroundColor(.black)
                    .frame(width: 150, height: 50)
                    .background(Rectangle().fill(Color(red: 0.671, green: 0.78, blue: 0.9)).cornerRadius(15))
                    .padding(10)
            }
        }
        .navigationBarTitle(Text("Settings"))
        .navigationBarItems(leading: Image(systemName: "gear").foregroundColor(.black))//systemName: "figure.run")) not available ios 15
        .font(.title)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.4, green: 0.6, blue: 0.8).edgesIgnoringSafeArea(.all))
        Text("HomeView")
            .navigationTitle("V24")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Sign Out") {
                        signOutUser()
                    }
                }
            }
    }
    
    
    func signOutUser() {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
        withAnimation {
            viewRouter.currentPage = .signInPage
        }
    }
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(settings: Settings())
    }
}
