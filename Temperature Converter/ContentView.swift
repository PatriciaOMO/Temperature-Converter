//
//  ContentView.swift
//  Temperature Converter
//
//  Created by Patricia Obregon on 9/17/21.
//

import SwiftUI
// to round numbers
import Foundation

struct ContentView: View {
    
    @State var degreesString: String = ""
    @State var degreesDbl: Double = 0
    @State var degreesInt: Int = 0
    @State var type = 1
    @State var result = ""
    
    var body: some View {
        
        VStack {
            Text("Temperature Converter")
                .bold()
                .padding()
            
            HStack {
                VStack {
                    // Degrees: (get user input)
                    Text("Degrees")
                        .foregroundColor(.gray)
//                    TextField("Degrees", value: $number, formatter: NumberFormatter())
//                        .frame(width: 100, height: 5, alignment: .center)
//                        .keyboardType(.numberPad)
//                        .padding()
                    
                   
                
                        
                    TextField("", text: $degreesString)
                        .keyboardType(.numberPad)
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 30)
                    
                    Divider()
                        .frame(width: 100)
                            
                        
                }
                .padding(.trailing)
                
                //MARK: Picker
                VStack {
                    // Type: Drop down picker to choose  C F
                    Text("Type")
                        .foregroundColor(.gray)
                    Picker(selection: $type, label: Text("Type"),
                            content: {
                                Text("°F").tag(1)
                                Text("°C").tag(2)
                    })
//                        .padding()
                        .pickerStyle(SegmentedPickerStyle())
                        .frame(width: 100)
                        
                  
                }
                .padding(.horizontal)
                
                
            }
            .padding(.horizontal)
            
           
            //MARK: Button
            VStack {
                
                // TODO: check for nil. but can an optional be binding?
                // Button: Convert
                
                Button(action: {
                    
                    if type == 1 {
                        degreesDbl = Double(degreesString)!
                        degreesDbl = (degreesDbl - 32) * (0.5556)
                        degreesInt = Int(degreesDbl.rounded())
                        result = String(degreesInt) + " °C"
                        
                    } else if type == 2 {
                        degreesDbl = Double(degreesString)!
                        degreesDbl = degreesDbl * (1.8) + 32
                        degreesInt = Int(degreesDbl.rounded())
                        result = String(degreesInt) + " °F"
                    }
                }, label: {
                    Text("Convert")
                        .font(.title2)
                        .padding(.horizontal)
                        .foregroundColor(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.gray, lineWidth: 2))
                })
                .padding()
                .frame(height: 30.0)
//                .border(Color.black, width: 2)
                
                
                
                Text(result)
                    .font(.largeTitle)
                
            }
            .padding(.top, 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
