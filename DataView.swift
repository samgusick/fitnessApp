//
//  DataView.swift
//  WalkingTabBar
//
//  Created by Max Heath on 10/18/22.
//

import SwiftUI
struct DataView: View {
    var body: some View {
        VStack {
            Image(systemName: "questionmark.circle")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Data screen")
        }
        .padding()
    }
}


struct DataView_Previews: PreviewProvider {
    static var previews: some View {
        DataView()
    }
}

