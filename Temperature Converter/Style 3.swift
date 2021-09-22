//
//  Style 3.swift
//  Temperature Converter
//
//  Created by Patricia Obregon on 9/22/21.
//

import SwiftUI
import Foundation

struct Style_3: View {
    
    @State var userInput: Double = 0
    @State var picker1 = 1
    @State var picker2 = 1
    @State var convertedDegrees: Double = 0
    @State var result = " "
    
    var body: some View {
        
        VStack {
            
            Text("Temperature Converter")
                .font(.title)
            
            HStack {
                    
                TextField("Degrees", value: $userInput, formatter: NumberFormatter())
                    .frame(width: 150)
                    .padding(5)
                    .border(Color.gray)
                    .cornerRadius(5)
                    .keyboardType(.numberPad)
                
                Spacer()
                    
                
                Picker(selection: $picker1, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/, content: {
                    Text("°F").tag(1)
                    Text("°C").tag(2)
                })
                .frame(width: 50, height: 100)
                .clipped()
            }
            .padding(.horizontal)
            
            Divider()
                .background(Color.gray)
                .padding()
            
            HStack {
                
                // TODO: Show result
                Text("\(result)")
                
                Spacer()
                
                Picker(selection: $picker2, label: Text("convert to"), content: {
                    Text("°F").tag(1)
                    Text("°C").tag(2)
                    Text("K").tag(3)
                })
                .frame(width: 50, height: 100)
                .clipped()
                               
            }
            .padding(.horizontal)
        }
        .onChange(of: picker2, perform: { value in
            convert(tag: value)
        })
        
    }
    
    func convert(tag: Int) {
        // F -> C
        if picker1 == 1 && picker2 == 2 {
            convertedDegrees = (userInput - 32) * (0.5556)
            result = "\(convertedDegrees.rounded()) °C"
            
        }
        // F -> K
        else if picker1 == 1 && picker2 == 3 {
            convertedDegrees = (userInput - 32) * (0.5556) + (273.15)
            result = "\(convertedDegrees.rounded()) K"
        }
        // C -> F
        else if picker1 == 2 && picker1 == 1 {
            convertedDegrees = userInput * (1.8) + 32
            result = "\(convertedDegrees.rounded()) °F"
        }
        // C -> K
        else if picker1 == 2 && picker2 == 3 {
            convertedDegrees = (userInput + 273.15)
            result = "\(convertedDegrees.rounded()) K"
        }
    }
}

struct Style_3_Previews: PreviewProvider {
    static var previews: some View {
        Style_3()
    }
}
