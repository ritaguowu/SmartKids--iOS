//
//  WelcomeView.swift
//  SmartKids
//
//  Created by Wu Guo on 2022-09-04.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {

             VStack {
                 Text("SmartKids")
                     .font(Font.custom("sacramento", size: 50))
                     .foregroundColor(Color.init(red: 0.20, green: 0.60, blue: 0.86))
                 .padding()
                 
                 
                 Image("ic_group_image").resizable()
                     .aspectRatio(contentMode: .fit)
                     .frame(width: 280, height: 280)
                 
                 Text("Finding Your Kids Genius")
                     .font(Font.custom("sacramento", size: 25))
                     .foregroundColor(Color.black)
                     .fontWeight(.black)
                 .padding(25)
                 
                 
                 ButtonView(text: "Create parent account")
                     
                 
                 Button("I have an account") {
                     /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                 }.padding(.all)
                 

             }
         }
    }

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}


