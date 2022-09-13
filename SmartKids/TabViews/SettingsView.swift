//
//  SettingsView.swift
//  SmartKids
//
//  Created by Wu Guo on 2022-09-12.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var loginVM: LoginViewModel
    @State private var isLogout = false
    
    var body: some View {
        VStack{
            HStack{
                ParentInfoView()
            }.background(Color("Secondary"))
                .padding(.top, 30)
            
            VStack{
                HStack{
                    Text("My Profit")
                        .fontWeight(.bold)
                        .font(.system(size: 22))
                        .foregroundColor(Color.yellow)
                        .padding(30)
                    Spacer()
                }
                HStack{
                    Text("My Message")
                        .fontWeight(.bold)
                        .font(.system(size: 22))
                        .foregroundColor(Color.yellow)
                        .padding(30)
                    Spacer()
                }
                
                HStack{
                    Button() {
                        loginVM.isLoggedIn = false
                    }label: {
                        Text("Log out")
                            .fontWeight(.bold)
                            .font(.system(size: 22))
                            .foregroundColor(Color.yellow)
                            .padding(30)
                            .padding(.top, 50)
                            .padding(.bottom, 200)
                    }.foregroundColor(Color.yellow)
            
                    Spacer()
                }
                
//                NavigationLink(destination: WelcomeView(), isActive: $loginVM.isLoggedIn){
//                    EmptyView()
//                }
            }.background(Color("Primary"))
            
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
