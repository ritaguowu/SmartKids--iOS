//
//  WelcomeView.swift
//  SmartKids
//
//  Created by Wu Guo on 2022-09-04.
//

import SwiftUI

struct WelcomeView: View {
    @StateObject var loginVM = LoginViewModel()
    @StateObject var kidVM = KidViewModel()
    @StateObject var kidsListVM = KidsListViewModel()
    
    @State private var showSignUp: Bool = false;
    @State private var showSignIn: Bool = false;
    
    
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
                 
                 VStack{
                     Group{
                         Button(){
                             showSignUp = true
                                 } label:{
                                     ButtonView(text: "Create parent account")
                                 }.cornerRadius(15)
                         NavigationLink(destination: SignUpView(), isActive: $showSignUp){
                             EmptyView()
                         }
                     }.padding(.bottom, 10)
                     
                     
                     Group{
                         Button("I have an account") {
                             showSignIn = true
                         }
//
//                         NavigationLink(destination: ParentView(), isActive: $loginVM.isAuthenticated){
//                         }
                         
                         NavigationLink(destination: SignInView().environmentObject(self.loginVM), isActive: $showSignIn){
                             EmptyView()
                         }
                     }
                 }
                 
             }.padding(.bottom, 50)
            .environmentObject(loginVM)
            .environmentObject(kidVM)
            .environmentObject(kidsListVM)
         }

}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}


