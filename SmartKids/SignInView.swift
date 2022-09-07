//
//  SignInView.swift
//  SmartKids
//
//  Created by Wu Guo on 2022-09-05.
//

import SwiftUI

struct SignInView: View {

    //    @Binding var isShow: Bool
    @StateObject private var loginVM = LoginViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            Text("Please enter your email and password")
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .padding(25)
            Spacer()

            
            TextField("Email", text: $loginVM.email)
                .padding()
                .textViewStyle()

            
            SecureField("Password", text: $loginVM.password)
                .padding()
                .textViewStyle()

 
            Button(){
                loginVM.login()
            } label:{
                ButtonView(text: "Sign In")
            }.cornerRadius(15)
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
