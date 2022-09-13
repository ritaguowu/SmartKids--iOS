//
//  MyProfileView.swift
//  SmartKids
//
//  Created by Wu Guo on 2022-09-05.
//

import SwiftUI

struct MyProfileView: View {
    @EnvironmentObject var loginVM: LoginViewModel

    
    var body: some View {
        VStack{
            HStack{
                ParentInfoView()
            }.background(Color("Secondary"))
                .padding(.leading)
            
            Group{
                
                Text("My Profit")
                    .padding(.bottom,30)
                    .foregroundColor(Color.yellow)
                Text("My Message")
                    .padding(.bottom,30)
                    .foregroundColor(Color.yellow)
                Button("Logout") {
                    loginVM.isLoggedIn = false
                }
            
                Spacer()
                
            }
        }.background(Color.blue)
    }
}

struct MyProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MyProfileView()
    }
}
