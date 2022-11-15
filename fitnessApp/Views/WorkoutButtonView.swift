//
//  WorkoutButtonView.swift
//  fitnessApp
//
//  Created by Liam Hackett on 11/15/22.
//

import SwiftUI

struct WorkoutButtonView: View {
    @State var label : String
    var body: some View {
        Text(label)
            .foregroundColor(.black)
            .frame(width: 150, height: 50)
            .background(Rectangle().fill(Color(red: 0.671, green: 0.78, blue: 0.9)).cornerRadius(15))
            .padding(10)
    }
}

struct WorkoutButtonView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutButtonView(label: "Push Day")
    }
}
