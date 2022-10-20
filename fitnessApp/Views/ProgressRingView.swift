//
//  ProgressRingView.swift
//  fitnessApp
//
//  Created by Liam Hackett on 10/19/22.
//
import SwiftUI
import HealthKitUI
import Foundation


extension Color {
    public static var outlineRed: Color {
        return Color(decimalRed: 34, green: 0, blue: 3)
    }

    public static var darkRed: Color {
        return Color(decimalRed: 221, green: 31, blue: 59)
    }

    public static var lightRed: Color {
        return Color(decimalRed: 239, green: 54, blue: 128)
    }

    public init(decimalRed red: Double, green: Double, blue: Double) {
        self.init(red: red / 255, green: green / 255, blue: blue / 255)
    }
}

struct ProgressRingView: View {
    
    @Binding var progress: CGFloat
    var goal : CGFloat 
    var colors: [Color] = [Color.darkRed, Color.lightRed]
    
    
    var body: some View {
        ZStack {
            Text("\(Int(progress))/ \(Int(goal))\n")
                .foregroundColor(.black)
            Text("\n\tSteps").opacity(0.6)
                .foregroundColor(.black)
            Circle()
                .stroke(Color.outlineRed, lineWidth: 30)
            Circle()
                .trim(from: 0, to: progress/goal)
                .stroke(
                    AngularGradient(
                        gradient: Gradient(colors: colors),
                        center: .center,
                        startAngle: .degrees(0),
                        endAngle: .degrees(360)
                    ),
                    style: StrokeStyle(lineWidth: 30, lineCap: .round)
            ).rotationEffect(.degrees(-90))
            Circle()
                .frame(width: 20, height: 20)
                .foregroundColor(Color.darkRed)
                .offset(y: -100)
            Circle()
                .frame(width: 20, height: 20)
                .foregroundColor(progress/goal > 0.95 ? Color.lightRed: Color.lightRed.opacity(0))
                .offset(y: -100)
                .rotationEffect(Angle.degrees(360 * Double(progress)))
                .shadow(color: progress/goal > 0.96 ? Color.black.opacity(0.1): Color.clear, radius: 3, x: 4, y: 0)
        }.frame(idealWidth: 150, maxWidth: 200, idealHeight: 150, maxHeight: 200, alignment: .center)
            .offset(y: 150)
            .animation(.spring(response: 0.6, dampingFraction: 1.0, blendDuration: 1.0), value: progress)
    }
    
}
