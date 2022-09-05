//
//  SignInView.swift
//  SmartKids
//
//  Created by Wu Guo on 2022-09-05.
//

import SwiftUI

struct SignInView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            Spacer()
            Text("Please enter your email and password")
                .multilineTextAlignment(.center)
                .padding(25)
            Spacer()

            
            TextField("Email", text: $email)
                .padding()
                .textViewStyle()

            
            TextField("Password", text: $password)
                .padding()
                .textViewStyle()

 
            ButtonView(text: "Sign In")
                .padding(30)

            Spacer(minLength: 250)
        
        }.padding(40)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
