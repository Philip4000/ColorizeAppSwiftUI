//
//  ContentView.swift
//  CourseThreeLeesonTwoHomework
//
//  Created by Philip Noskov on 05.06.2021.
//

import SwiftUI

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
            
            VStack {
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
                
                HStack {
                    TextValues(
                        redSliderValue: redSliderValue,
                        greenSliderValue: greenSliderValue,
                        blueSliderValue: blueSliderValue
                    )
                    
                    ColorSliders(
                        redSliderValue: $redSliderValue,
                        greenSliderValue: $greenSliderValue,
                        blueSliderValue: $blueSliderValue
                    )
                    
                    TextFields(
                        redSliderValue: $redSliderValue,
                        greenSliderValue: $greenSliderValue,
                        blueSliderValue: $blueSliderValue
                    )
                }
                .padding()
                
                Spacer()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
 

struct ColorSliders: View {
    
    @Binding var redSliderValue: Double
    @Binding var greenSliderValue: Double
    @Binding var blueSliderValue: Double
    
    var body: some View {
        VStack {
            Slider(value: $redSliderValue, in: 0...255)
                .accentColor(.red)
            Slider(value: $greenSliderValue, in: 0...255)
                .accentColor(.green)
            Slider(value: $blueSliderValue, in: 0...255)
                .accentColor(.blue)
            
        }
    }
}

struct TextFields: View {
    
    @Binding var redSliderValue: Double
    @Binding var greenSliderValue: Double
    @Binding var blueSliderValue: Double
    @State private var alertPresented = false
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        formatter.maximumFractionDigits = 0
        return formatter
    }()
    
    var body: some View {
        
        VStack {
            
            TextField("", value: $redSliderValue, formatter: formatter, onCommit: {
                if 0...255 ~= redSliderValue {
                    return
                } else {
                    alertPresented.toggle()
                    redSliderValue = 50
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
            
            TextField("", value: $greenSliderValue, formatter: formatter, onCommit: {
                if 0...255 ~= greenSliderValue {
                    return
                } else {
                    alertPresented.toggle()
                    greenSliderValue = 125
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
            
            TextField("", value: $blueSliderValue, formatter: formatter, onCommit: {
                if 0...255 ~= blueSliderValue {
                    return
                } else {
                    alertPresented.toggle()
                    blueSliderValue = 220.0
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

struct TextValues: View {
    
    var redSliderValue: Double
    var greenSliderValue: Double
    var blueSliderValue: Double
    
    var body: some View {
        VStack {
            Text("\(lround(redSliderValue))")
                .bold()
                .frame(width: 50, height: 40)
            Text("\(lround(greenSliderValue))")
                .bold()
                .frame(width: 50, height: 40)
            Text("\(lround(blueSliderValue))")
                .bold()
                .frame(width: 50, height: 40)
        }
        
    }
}
