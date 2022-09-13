//
//  SignInView.swift
//  SmartKids
//
//  Created by Wu Guo on 2022-09-05.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var loginVM : LoginViewModel

    @State private var errorMessage = ""
    
    
    var body: some View {
        VStack {
                 VStack{
                     Spacer()
                     
                     Text("Please enter your email and password")
                         .multilineTextAlignment(.center)
                         .fixedSize(horizontal: false, vertical: true)
                         .padding(25)
                     
                     Spacer()
                 }
                 
                 VStack{
                     Text("\(errorMessage)")
                         .foregroundColor(Color.red)
                     
                     TextField("Email", text: $loginVM.email)
                         .padding()
                         .textViewStyle()
                     
                     SecureField("Password", text: $loginVM.password)
                         .padding()
                         .textViewStyle()
                 }
                 
                 Button(){
                     loginVM.login()
                     if loginVM.isAuthenticated == false{
                         errorMessage = "Sorry, wrong use information! "
                     }
                     
                 } label:{
                     ButtonView(text: "Sign In")
                 }.cornerRadius(15)
                     .padding(30)
                 //.sheet mode: which you can pull down the screen and close it
                 //.fullScreenCover
                     .fullScreenCover(isPresented: $loginVM.isAuthenticated){
     //                    NavigationView{
     //                        return ParentView().environmentObject(self.loginVM)
     //                    }
                         ParentView().environmentObject(self.loginVM)
                             .environmentObject(KidsListViewModel())
                         
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
