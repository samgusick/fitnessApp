//
//  DataView.swift
//  fitnessApp
//
//  Created by Liam Hackett on 10/18/22.
//

import SwiftUI

struct DataView: View {
    @Binding var clickedBack : Bool
    var title: String
    var barColor: Color
    var data: [Step]
    @State private var subtitle = "Total Steps "
    @State private var currentValue = ""
    @State private var currentLabel = ""
    @State private var touchCoords: CGFloat = -1
    @ObservedObject var settings: Settings
    
    func normalizedValue(index: Int) -> Double {
        var allValues: [Double]    {
            var values = [Double]()
            for data in data {
                values.append(Double(data.count))
            }
            return values
        }
        guard let max = allValues.max() else {
            return 1
        }
        if max != 0 {
            return Double(data[index].count)/Double(max)
        } else {
            return 1
        }
    }
    
    func barIsTouched(index: Int) -> Bool {
        touchCoords > CGFloat(index)/CGFloat(data.count) && touchCoords < CGFloat(index+1)/CGFloat(data.count)
    }
    
    func updateCurrentValue()    {
        let index = Int(touchCoords * CGFloat(data.count))
        guard index < data.count && index >= 0 else {
            subtitle = "Total Steps "
            currentValue = "\(data.map { $0.count }.reduce(0,+))"
            currentLabel = ""
            return
        }
        subtitle = "Step Count"
        currentValue = "\(data[index].count)"
        currentLabel = data[index].label
    }
    func reset() {
        touchCoords = -1
        subtitle = "Total Steps"
        currentValue  =  "\(data.map { $0.count }.reduce(0,+))"
        currentLabel = ""
    }
    
    func labelOffset(in width: CGFloat) -> CGFloat {
        let currentIndex = Int(touchCoords * CGFloat(data.count))
        guard currentIndex < data.count && currentIndex >= 0 else {
            return 0
        }
        let cellWidth = width / CGFloat(data.count)
        let actualWidth = width -    cellWidth
        let position = cellWidth * CGFloat(currentIndex) - actualWidth/2
        return position
    }
    
    
    var body: some View {
        if clickedBack {
            VStack(alignment: .leading) {
                Button{
                    clickedBack = false
                }label:{
                    Image(systemName: "lessthan")
                        .offset(x:10 )
                        .foregroundColor(.black)
                    Text("Home")
                        .font(.headline)
                        .foregroundColor(.black)
                        .offset(x:-10)
                        .frame(width: 75, height: 25)
                        .buttonStyle(.bordered)
            
                }
                Text(title)
                    .bold()
                    .font(.largeTitle)
                    .offset(y: -10)
                    .foregroundColor(.black)
                Text("\(subtitle): \(currentValue)")
                    .font(.headline)
                    .offset(x: 10)
                    .foregroundColor(.black)
                GeometryReader { geometry in
                    VStack {
                        HStack {
                            ForEach(0..<7, id: \.self) { i in
                                Bar(value: normalizedValue(index: i), color: barColor)
                                    .opacity(barIsTouched(index: i) ? 1 : 0.7)
                                    .scaleEffect(barIsTouched(index: i) ? CGSize(width: 1.05, height: 1) : CGSize(width: 1, height: 1), anchor: .bottom)
                                    .animation(.spring())
                                    .padding(.top)
                                
                            }
                        }
                        .gesture(DragGesture(minimumDistance: 0)
                            .onChanged({ position in
                                let touchPos = position.location.x/geometry.frame(in: .local).width
                                touchCoords = touchPos
                                updateCurrentValue()
                            })
//                                .onEnded({ position in
//                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                                        withAnimation(Animation.easeOut(duration: 0.5)) {
//                                            reset()
//                                        }
//                                    }
//                                })
                        )
                        
                        Text(currentLabel)
                            .bold()
                            .foregroundColor(.black)
                            .padding(5)
                            .background(RoundedRectangle(cornerRadius: 5).foregroundColor(.white).shadow(radius: 3))
                            .animation(.easeIn)
                            .offset(x: labelOffset(in: geometry.frame(in: .local).width))
                    }
                }
                .padding()
                
            }
            .background(Color(red: 0.4, green: 0.6, blue: 0.8).edgesIgnoringSafeArea(.all))
        }
        else{
            HomeView(settings: settings)
        }
    }
}
//struct DataView_Previews: PreviewProvider {
//    static var previews: some View {
//        let steps = [Step(count: 3452, date: Date(), label: "11/01"),
//                         Step(count: 123, date: Date(), label: "11/01"),
//                         Step(count: 1223, date: Date(), label: "11/01"),
//                         Step(count: 5223, date: Date(), label: "11/01"),
//                         Step(count: 12023, date: Date(), label:"11/01"),
//                         Step(count: 5223, date: Date(), label: "11/01"),
//                         Step(count: 12023, date: Date(), label: "11/01")]
//
//        DataView(title: " Weekly Steps", barColor: .darkRed, data: steps)
//    }
//}
//
//
