//
//  WorkoutButtonView.swift
//  fitnessApp
//
//  Created by Liam Hackett on 11/15/22.
//

import SwiftUI

struct WorkoutButtonView: View {
    @State var label : String
    @ObservedObject var settings : Settings
    var body: some View {
        Text(label)
            .foregroundColor(.black)
            .frame(width: 150, height: 50)
            .background(Rectangle().fill(settings.accentColor).cornerRadius(15))
            .padding(10)
    }
}

struct WorkoutButtonView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutButtonView(label: "Push Day", settings: Settings())
    }
}
