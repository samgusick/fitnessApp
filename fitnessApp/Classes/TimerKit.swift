//
//  TimerKit.swift
//  fitnessApp
//
//  Created by Liam Hackett on 10/24/22.
//

import Foundation

enum timerMode{
    case running
    case stopped
    case paused
    
}
class TimerKit : ObservableObject{
    @Published var secondsElapsed = 0.0
    @Published var mode: timerMode = .stopped
    var timer = Timer()
    
    func start() {
        mode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            self.secondsElapsed += 0.1
        }
    }
    func pause(){
        timer.invalidate()
        mode = .paused
    }
    func reset() {
        timer.invalidate()
        secondsElapsed = 0
        mode = .stopped
    }
    
}
