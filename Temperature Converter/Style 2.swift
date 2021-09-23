//
//  Style 2.swift
//  Temperature Converter
//
//  Created by Patricia Obregon on 9/19/21.
//

import SwiftUI

struct Style_2: View {
    
    @State var degreesString = ""
    @State var degreesDbl: Double = 0
    @State var degreesInt: Int = 0
    @State var type = 1
    @State var result = ""
    
    var body: some View {

            
        VStack {
            Text("Temperature Converter")
            
            HStack {
                VStack {
                    
                    // Degrees to convert (get user input)
                    TextField("Degrees", text: $degreesString)
                        .keyboardType(.numberPad)
                        .frame(width: 100)
                        .foregroundColor(.gray)
                    
                    Divider()
                        .frame(width: 100, height: 1).background(Color.gray)
                        
                }
                
                Spacer()
                
                //MARK: Picker
                VStack {
                    // Type: Drop down picker to choose  degree you're starting with
                    Picker(selection: $type, label: Text("Type"),
                            content: {
                                Text("°F").tag(1)
                                Text("°C").tag(2)
                    })
                        .pickerStyle(WheelPickerStyle())
                        .padding()
                        .frame(width: 50, height: 100)
                        .clipped()
                }
            }
            .padding(.horizontal)
           
            // MARK: Button
            VStack {
                
                Button(action: {
                    
                    // make sure it's not nil and assign to new variable
                    print("degreeString, \(degreesString)")
                    guard let convertedDegrees = Double(degreesString) else {
                        return
                    }
                    
                    if type == 1 {
//                        degreesDbl = Double(degreesString)
                        degreesDbl = (convertedDegrees - 32) * (0.5556)
                        degreesInt = Int(degreesDbl.rounded())
                        result = "\(degreesInt) °C"
                        
                    } else if type == 2 {
//                        degreesDbl = Double(degreesString)!
                        degreesDbl = convertedDegrees * (1.8) + 32
                        degreesInt = Int(degreesDbl.rounded())
                        result = String(degreesInt) + " °F"
                    }
                }, label: {
                    Text("Convert")
                        .font(.title2)
                        .padding(.horizontal)
                        .foregroundColor(.gray)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.gray, lineWidth: 2))
                })
                .padding()
                .frame(height: 30.0)
                
                Text(result)
                    .font(.largeTitle)
                
            }
            .padding(.top, 20)
        }
        .padding(.horizontal)
        
    }
    
    
}

struct Style_2_Previews: PreviewProvider {
    static var previews: some View {
        Style_2()
    }
}
