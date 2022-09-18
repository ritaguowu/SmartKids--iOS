//
//  QuestionRowView.swift
//  FinalProjectDemo
//
//  Created by Atsuko Kuwahara on 2022-08-29.
//

import SwiftUI

struct QuestionRowView: View {
    
    var text: String
    var question: String = ""
    
    var body: some View {
        HStack{
            RoundedRectangle(cornerRadius: 10)
                .stroke(.red, lineWidth: 5)
                .frame(width: 350, height: 50)
                .overlay(
                    HStack {
                        Text(text)
                            .font(.system(size: 30))
                            .padding()
                        Spacer()
                        Text("\(question)")
                            .font(.system(size: 30))
                            .bold()
                            .padding(.trailing)
                        
                    })
            
        }
    }
}


struct QuestionRowView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionRowView(text: "Question: ", question:"1 + 2 =")
    }
}
