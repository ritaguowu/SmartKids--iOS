//
//  KidPlayView.swift
//  SmartKids
//
//  Created by Wu Guo on 2022-09-08.
//

import SwiftUI

struct KidPlayView: View {
    @StateObject var kidVM = KidViewModel()
    
    let selectedKid: Kid
    
    
    var body: some View {
        ZStack{
            VStack{
                Text("\(kidVM.kid.user_name)")
                Text("\(kidVM.kid._id)")
            }.padding(.all)
            
        }.environmentObject(kidVM)
        .onAppear(){
//            encodeKidObject(kid: selectedKid, key: "currentKid")
            kidVM.loadKid(kidId: selectedKid._id)
    }
    }
}



struct KidPlayView_Previews: PreviewProvider {
    static var previews: some View {
        KidsView().environmentObject(KidViewModel())
    }
}
