//
//  ContentView.swift
//  Colorized App
//
//  Created by Тимофей Юдин on 13.06.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    
    @State var redColor = Color.red
    @State var greenColor = Color.green
    @State var blueColor = Color.blue
    
    var color: Color {
        Color(
            red: redSliderValue / 255,
            green: greenSliderValue /  255,
            blue: blueSliderValue / 255
        )
    }
    
    var body: some View {
        ZStack {
            Color(red: 0, green: 0.4, blue: 0.6)
                .ignoresSafeArea()
            VStack {
                RoundedRectangle(cornerRadius: 10)
                    .overlay(
                        RoundedRectangle(
                            cornerRadius: 10
                        ).stroke(.white, lineWidth: 3)
                    )
                    .frame(width: 350, height: 150)
                    .foregroundColor(color)
                    .padding(.top, 50)
                    .padding(.leading, 16)
                SliderView(value: $redSliderValue, color: $redColor)
                    .padding(.top, 70)
                SliderView(value: $greenSliderValue, color: $greenColor)
                SliderView(value: $blueSliderValue, color: $blueColor)
                Spacer()
            }
            .padding(.trailing, 16)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SliderView: View {
    @Binding var value: Double
    @Binding var color: Color
    
    var body: some View {
        HStack {
            Text("\(lround(value))")
                .frame(width: 40, height: 20)
                .foregroundColor(.white)
            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(color)
        }
    }
}
