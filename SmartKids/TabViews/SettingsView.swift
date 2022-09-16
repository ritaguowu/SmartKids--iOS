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
    @State private var isShowMyProfile = false

    
    var body: some View {
        VStack{
            HStack{
                ParentInfoView()
            }.background(Color("Secondary"))
                .padding(.top, 50)
            
            VStack{
                HStack{
                    Group{
                        Button() {
                                isShowMyProfile = true
                        }label: {
                            Text("My Profile")
                                .fontWeight(.bold)
                                .font(.system(size: 22))
                                .foregroundColor(Color.yellow)
                                .padding(30)
                                .padding(.top, 30)
                                .padding(.bottom, 30)
                        }.foregroundColor(Color.yellow)
                            .sheet(isPresented: $isShowMyProfile){
                                MyProfileView().environmentObject(self.loginVM)
                                
                            }
                    }
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
                    Group{
                        Button() {
                            self.isLogout = true
                            loginVM.isLoggedIn = false
                            UserDefaults.standard.setValue("", forKey: "jwtToken")
                            UserDefaults.standard.setValue("", forKey: "parentId")
                            
                        }label: {
                            Text("Log out")
                                .fontWeight(.bold)
                                .font(.system(size: 22))
                                .foregroundColor(Color.yellow)
                                .padding(30)
                                .padding(.top, 50)
                                .padding(.bottom, 120)
                        }.foregroundColor(Color.yellow)
                    }
                    Spacer()
                }
                
            }.background(Color("Primary"))
            
        }.fullScreenCover(isPresented: $isLogout){
            ContentView()
            
        }
    }
}

//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView( parentUser: <#User#>)
//    }
//}
