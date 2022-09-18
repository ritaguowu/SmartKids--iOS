//
//  ScoreRowView.swift
//  FinalProjectDemo
//
//  Created by Atsuko Kuwahara on 2022-08-30.
//

import SwiftUI

struct ScoreRowView: View {
    
    var text: String
    var score: String = "0"
    
    var body: some View {
        HStack{
            //            Spacer()
            RoundedRectangle(cornerRadius: 10)
                .stroke(.purple, lineWidth: 5)
                .frame(width: 200, height: 50)
                .overlay(
                    HStack {
                        Text(text)
                            .font(.system(size: 30))
                            .padding()
                        Spacer()
                        Text(score)
                            .font(.system(size: 30))
                            .bold()
                            .padding(.trailing)
                        
                    })
            //.background(.gray)
                .padding()
        }
        
    }
}

struct ScoreRowView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreRowView(text: "Score:", score: "0")
    }
}
