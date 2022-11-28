//
//  TimerButtonView.swift
//  fitnessApp
//
//  Created by Liam Hackett on 11/14/22.
//

import SwiftUI

struct TimerButtonView: View {
    @ObservedObject var timer : TimerKit = TimerKit()
    @Binding var accentColor : Color
    var body: some View {
        ZStack{
            Text(timer.label)
                .monospacedDigit()
                .fixedSize(horizontal: false, vertical: true)
                .frame(width: 350, height: 100)
                .multilineTextAlignment(.leading)
                .padding(5)
                .background(Rectangle().fill(accentColor)
                    .shadow(radius: 3)
                    .cornerRadius(10))
                .foregroundColor(.black)
            
            if timer.mode == .stopped {
                Button{
                    timer.start()
                } label: {
                    TimerView(label: "play.fill", buttonColor: .black)
                }
                .offset(x: -110)
            }
            if timer.mode == .running {
                Button{
                    timer.pause()
                } label: {
                    TimerView(label: "pause.fill", buttonColor: .black)
                }.offset(x: -110)
                Button{
                    timer.reset()
                } label: {
                    Image(systemName: "stop.fill")
                        .foregroundColor(.black)
                }.offset(x: -150)
            }
            if timer.mode == .paused {
                Button{
                    timer.start()
                } label: {
                    TimerView(label: "play.fill", buttonColor: .black)
                }.offset(x: -110)
                Button{
                    timer.reset()
                } label: {
                    Image(systemName: "gobackward")
                        .foregroundColor(.black)
                }.offset(x: -150)
            }
            
            Image(systemName: "stopwatch").offset(x: 75)
                .foregroundColor(.black)
            
        }
    }
}

//struct TimerButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        TimerButtonView()
//    }
//}
