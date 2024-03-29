///
//  Settings.swift
//  fitnessApp
//
//  Created by Max Heath on 11/17/22.
//
import Foundation
import SwiftUI

enum days {
    case push
    case pull
    case leg
    case off
}

class Settings : ObservableObject {
    @Published var backgroundColor = Color(red: 0.4, green: 0.6, blue: 0.8)
    @Published var accentColor = Color(red: 0.671, green: 0.78, blue: 0.9)

    @Published var sunday = "Off Day"
    @Published var monday = "Push Day"
    @Published var tuesday = "Pull Day"
    @Published var wednesday = "Leg Day"
    @Published var thursday = "Push Day"
    @Published var friday = "Pull Day"
    @Published var saturday = "Off Day"
    
    @Published var goal : CGFloat = 5000
    
    func changeBackgroundColor(_ color: Color) {
        backgroundColor = color
    }
    func changeAccentColor(_ color: Color) {
        accentColor = color
    }
    func changeColor(accent: Color, background: Color) {
        changeBackgroundColor(background)
        changeAccentColor(accent)
    }
    func changeDay(day: inout String, workout: String) {
        day = workout
    }
}

