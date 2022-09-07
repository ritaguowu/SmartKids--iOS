//
//  SignUpView.swift
//  SmartKids
//
//  Created by Wu Guo on 2022-09-05.
//

import SwiftUI

struct SignUpView: View {
    @State var username = ""
    @State var email = ""
    @State var password = ""
    
    
    var body: some View {
        VStack {
            Spacer()
            Text("Enter your name, email id and password, to register with us!")
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .padding(25)
            Spacer()
            
            TextField("Name", text: $username)
                .padding()
                .textViewStyle()
                

            
            TextField("Email", text: $email)
                .padding()
                .textViewStyle()

            
            SecureField("Password", text: $password)
                .padding()
                .textViewStyle()

 
            Button(){
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            } label:{
                ButtonView(text: "Sign Up")
            }.cornerRadius(15)
                .padding(30)

            Spacer(minLength: 180)
        
        }.padding(30)

    }
}

struct ShadowViewModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .overlay(RoundedRectangle(cornerRadius: 5)
                .stroke(Color(.white), lineWidth: 4)
                .shadow(color: Color("darkShadow"), radius: 4, x: 5, y: 5))
            .clipShape(RoundedRectangle(cornerRadius: 0))
            .shadow(color: Color("lightShadow"), radius: 8, x: -8, y: -8)
            .shadow(color: Color("darkShadow"), radius: 8, x: 8, y: 8)
            .frame(width: 350, height: 50)
            .padding(10)

    }
}


struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

