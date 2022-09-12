//
//  ParentInfoView.swift
//  SmartKids
//
//  Created by Wu Guo on 2022-09-11.
//

import SwiftUI

struct ParentInfoView: View {
    
    let parent = decodeObject(key: "parent")
    
    var body: some View {
        Image("default_user")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 80, height: 60)
            .clipShape(Circle())
        
        VStack{
            Text("\(parent.user_name)")
            Text("\(parent.email)")
            //                        Text("\(loginVM.perant!.user_name)")
            //                        Text("\(loginVM.perant!.email)")
        }.foregroundColor(Color.white)
        
        Spacer()
    }
}

struct ParentInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ParentInfoView()
    }
}
