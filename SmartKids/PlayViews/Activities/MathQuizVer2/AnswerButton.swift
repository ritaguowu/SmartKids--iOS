//
//  AnswerButton.swift
//  FinalProjectDemo
//
//  Created by Atsuko Kuwahara on 2022-08-31.
//

import SwiftUI

struct AnswerButton: View {
    var number: Int
    
    let colors: [Color] = [.red, .green, .blue, .yellow, .orange]
    
    var body: some View {
        Text("\(number)")
            .frame(width: 110, height: 110)
            .font(.system(size: 40, weight: .bold))
            .foregroundColor(Color.white)
            .background(colors[number%5])
            .clipShape(Circle())
            .padding()
    }
}

struct AnswerButton_Previews: PreviewProvider {
    static var previews: some View {
        AnswerButton(number: 100)
    }
}
