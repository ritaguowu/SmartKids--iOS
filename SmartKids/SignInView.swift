//
//  SignInView.swift
//  SmartKids
//
//  Created by Wu Guo on 2022-09-05.
//

import SwiftUI

struct SignInView: View {

    @StateObject private var loginVM = LoginViewModel()
    @State private var isFirstLogin = true
    
    var body: some View {
             VStack {
                Spacer()
                 
                Text("Please enter your email and password")
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(25)
                 
                Spacer()
    
                 Text((isFirstLogin && !loginVM.isAuthenticated) ? "" : "Sorry, password is not correct!")
                     .foregroundColor(Color.red)
                 
                TextField("Email", text: $loginVM.email)
                    .padding()
                    .textViewStyle()
                 
                SecureField("Password", text: $loginVM.password)
                    .padding()
                    .textViewStyle()
                 
                 
                Button(){
                    loginVM.login()
                    isFirstLogin = false
                } label:{
                    ButtonView(text: "Sign In")
                }.cornerRadius(15)
                .padding(30)
                 //.sheet mode: which you can pull down the screen and close it
                .fullScreenCover(isPresented: $loginVM.isAuthenticated){
                    ParentView()
                }

                Spacer(minLength: 250)
            
            }.padding(40)
                

        }

}
struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
