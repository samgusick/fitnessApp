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

    @Published var sunday : days = .off
    @Published var monday : days = .push
    @Published var tuesday : days = .pull
    @Published var wednesday : days = .leg
    @Published var thursday : days = .push
    @Published var friday : days = .pull
    @Published var saturday : days = .off
    
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
    func changeDay(day: inout days, workout: days) {
        day = workout
    }
}

