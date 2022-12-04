//
//  TimerView.swift
//  fitnessApp
//
//  Created by Liam Hackett on 10/24/22.
//

import SwiftUI

struct TimerView: View {
    
    let label: String
    let buttonColor: Color
    
    var body: some View {
        Image(systemName: label)
            .foregroundColor(buttonColor)
    }
}
struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(label: "play.fill" , buttonColor: .black )
    }
}
