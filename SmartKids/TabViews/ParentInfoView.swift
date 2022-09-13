//
//  ParentInfoView.swift
//  SmartKids
//
//  Created by Wu Guo on 2022-09-11.
//

import SwiftUI

struct ParentInfoView: View {
    @EnvironmentObject var loginVM: LoginViewModel
    static var defaultImage = UIImage(named: "default_user")
    
    let parent = decodeObject(key: "parent")
    

    
    var body: some View {
        if (parent.image == "")
        {
            Image(uiImage: ParentInfoView.defaultImage!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 60)
                .clipShape(Circle())
        }else{
            Image(uiImage: parent.image.imageFromBase64! )
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 60)
                .clipShape(Circle())
        }
//        Image(uiImage: UIImage(data: Data(base64Encoded: parent.image)! ) ?? ParentInfoView.defaultImage!)

        
        VStack{
//            Text("\(parent.user_name)")
//            Text("\(parent.email)")
             Text("\(loginVM.perant!.user_name)")
             Text("\(loginVM.perant!.email)")
        }.foregroundColor(Color.white)
        
        Spacer()
    }
}

struct ParentInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ParentInfoView()
    }
}
