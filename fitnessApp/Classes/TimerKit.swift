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
    @Published var label = "00:00.00"
    @Published var mode: timerMode = .stopped
    var min = 0
    var secondsElapsed = 0.0
    var timer = Timer()
    
    func start() {
        mode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
            self.label = "\(String(format: "%02d", self.min)):\(String(format: "%05.2f", (self.secondsElapsed)))"
            if self.secondsElapsed > 60{
                self.min+=1
                self.secondsElapsed = 0
                self.secondsElapsed += 0.01
            }else{
                self.secondsElapsed += 0.01
            }
        }
    }
    
    func pause() {
        timer.invalidate()
        mode = .paused
    }
    
    func reset() {
        timer.invalidate()
        secondsElapsed = 0
        min = 0
        self.label = "\(String(format: "%02d", self.min)):\(String(format: "%05.2f", (self.secondsElapsed)))"
        mode = .stopped
    }
    
}


