//
//  ButtonView.swift
//  SmartKids
//
//  Created by Wu Guo on 2022-09-05.
//

import SwiftUI

struct ButtonView: View {
    
    let text: String
    
    var body: some View {        
            Text(text)
                .bold()
                .frame(width: 350, height: 50)
                .foregroundColor(Color.white)
                .background(LinearGradient(gradient: Gradient(colors: [Color.init(red: 0.04, green: 0.80, blue: 0.92), Color.init(red: 0.04, green: 0.50, blue: 0.96)]), startPoint: .leading, endPoint: .trailing))
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.white, lineWidth: 2))
        
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(text:"Sign Up")
    }
}
