//
//  User Input.swift
//  Temperature Converter
//
//  Created by Patricia Obregon on 9/18/21.
//

import SwiftUI

struct User_Input: View {
    
    @State var userInput: Double = 0
    @State var pickerIndex = 1.0
    @State var inputResult: Double = 0
    
    var body: some View {
        
        VStack {
            TextField("", value: $userInput, formatter: NumberFormatter())
                .keyboardType(.numberPad)
                .background(Color.gray)
                .padding()
            
            Picker(selection: $pickerIndex, label: Text("pick"), content: {
                Text("1").tag(1)
                Text("2").tag(2)
            })
            .pickerStyle(SegmentedPickerStyle())
            
//            if pickerIndex == 1 {
//                inputResult = userInput + 1
//            }
//            
            Text("\(userInput)")
        }
    }
}

struct User_Input_Previews: PreviewProvider {
    static var previews: some View {
        User_Input()
    }
}
