//
//  ContentView.swift
//  CourseThreeLeesonTwoHomework
//
//  Created by Philip Noskov on 05.06.2021.
//

import SwiftUI

// MARK: - Content View

struct ContentView: View {
    
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(
                           colors: [Color.red, Color.orange]),
                           startPoint: .bottom,
                           endPoint: .top
            )
                .ignoresSafeArea()
            
            VStack{
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 170)
                    .foregroundColor(.init(red: redSliderValue/255,
                                           green: greenSliderValue/255,
                                           blue: blueSliderValue/255))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white, lineWidth: 2)
                    )
                    .shadow(color: .black
                            , radius: 2)
                    .padding()
                
                SliderView(sliderValue: $redSliderValue, sliderColor: .red)
                SliderView(sliderValue: $greenSliderValue, sliderColor: .green)
                SliderView(sliderValue: $blueSliderValue, sliderColor: .blue)
                
                Spacer()
            }
            .padding()
            }
        }
        
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


