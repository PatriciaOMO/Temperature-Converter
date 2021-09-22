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
        
        // This is used as a playground to check functions of textField
        
        VStack {
            TextField("", value: $userInput, formatter: NumberFormatter())
                .keyboardType(.numberPad)
                .padding()
            
            Picker(selection: $pickerIndex, label: Text("pick"), content: {
                Text("1").tag(1)
                Text("2").tag(2)
            })
            .pickerStyle(SegmentedPickerStyle())
            
            // NumberFormatter wont let me use userInput for even basic math
            Button(action: {
                inputResult = userInput
            }, label: {
                Text("Do Stuff")
            })
          
            Text("\(inputResult)")
                .font(.title)
            
        }.onChange(of: userInput, perform: { value in
            if pickerIndex == 1 {
                inputResult = userInput + 1
            }
        })
    }
}

struct User_Input_Previews: PreviewProvider {
    static var previews: some View {
        User_Input()
    }
}
