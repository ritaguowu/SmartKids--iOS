//
//  ContentView.swift
//  SmartKids
//
//  Created by Wu Guo on 2022-09-04.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
         ZStack{
             Image("ic_splash_background")
                 .resizable()
                 .aspectRatio( contentMode: .fill)
                 .edgesIgnoringSafeArea(.all)
             VStack {
                 Text("SmartKids")
                     .font(Font.custom("sacramento", size: 50))
                     .foregroundColor(Color.white)
                     .bold()
                 .padding()
             
             }
         }

    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
