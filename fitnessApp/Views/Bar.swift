//
//  Bar.swift
//  fitnessApp
//
//  Created by Liam Hackett on 10/20/22.
//

import SwiftUI

struct Bar: View {
    var value: Double
    var color : Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .fill(color)
            .scaleEffect(CGSize(width: 1, height: value), anchor: .bottom)
        
    }
}

struct Bar_Previews: PreviewProvider {
    static var previews: some View {
        Bar(value: 3800, color: .blue)
                     .previewLayout(.sizeThatFits)
    }
}
