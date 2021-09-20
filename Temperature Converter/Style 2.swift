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
        
        ZStack {
            Color.black
                .ignoresSafeArea(edges: .all)
            
            VStack {
                Text("Temperature Converter")
                    .foregroundColor(.gray)
                
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
                        // Type: Drop down picker to choose  C F
                        Picker(selection: $type, label: Text("Type"),
                                content: {
                                    Text("°F").tag(1)
                                    Text("°C").tag(2)
                        })
                            .pickerStyle(WheelPickerStyle()).background(Color.gray)
//                            .mask(LinearGradient(gradient: Gradient(colors: [Color.black.opacity(100), Color.clear]),
//                                                 startPoint: .bottom, endPoint: .top))
//                            .mask(LinearGradient(gradient: Gradient(colors: [Color.black.opacity(100), Color.clear]),
//                                                 startPoint: .center, endPoint: .bottom))
                            .padding()
                            .frame(width: 50, height: 100)
                            .clipped()
                    }
                }
                .padding(.horizontal)
            }
            .padding(.horizontal)
        }
    }
}

struct Style_2_Previews: PreviewProvider {
    static var previews: some View {
        Style_2()
    }
}
