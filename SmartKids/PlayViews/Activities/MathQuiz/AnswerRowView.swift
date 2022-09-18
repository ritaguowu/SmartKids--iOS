//
//  AnswerRowView.swift
//  FinalProjectDemo
//
//  Created by Atsuko Kuwahara on 2022-08-30.
//

import SwiftUI

struct AnswerRowView: View {
    
    var text: String
    var yourAnswer: String = "0"
    
    var body: some View {
        HStack{
            RoundedRectangle(cornerRadius: 10)
                .stroke(.yellow, lineWidth: 5)
                .frame(width: 350, height: 50)
                .overlay(
                    HStack {
                        Text(text)
                            .font(.system(size: 30))
                            .padding()
                        Spacer()
                        Text(yourAnswer)
                            .font(.system(size: 30))
                            .bold()
                            .padding(.trailing)
                        
                    })
            
        }
        .padding()
    }
}

struct AnswerRowView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRowView(text: "Answer: ", yourAnswer:"0")
    }
}
