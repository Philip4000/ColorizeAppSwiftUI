//
//  SliderView.swift
//  CourseThreeLeesonTwoHomework
//
//  Created by Philip Noskov on 07.06.2021.
//

import SwiftUI

struct SliderView: View {
    
    @Binding var sliderValue: Double
    @State private var alertPresented = false
    
    let sliderColor: Color
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        return formatter
    }()
    
    var body: some View {
        HStack{
            
            Text("\(lround(sliderValue))")
                .bold()
                .frame(width: 50, height: 40)
            
            Slider(value: $sliderValue, in: 0...255, step: 1)
                .accentColor(sliderColor)
            
            TextField("", value: $sliderValue, formatter: formatter, onCommit: {
                if 0...255 ~= sliderValue {
                    return
                } else {
                    alertPresented.toggle()
                    sliderValue = 127
                }
            })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .multilineTextAlignment(.center)
                .shadow(color: Color.gray.opacity(0.5), radius: 2)
                .frame(width: 60)
                .alert(isPresented: $alertPresented, content: {
                    Alert(title: Text("Wrong format!"),
                          message: Text("Please input a value in range from 0 to 255"))
            })
        } 
    }
}

struct SliderContent_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(sliderValue: .constant(50.0), sliderColor: .black)
    }
}
