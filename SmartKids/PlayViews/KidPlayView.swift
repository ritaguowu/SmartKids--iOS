//
//  KidPlayView.swift
//  SmartKids
//
//  Created by Wu Guo on 2022-09-08.
//

import SwiftUI

struct KidPlayView: View {
    
    let selectedKid: Kid
    
    var body: some View {
        ZStack{
            VStack{
            Text("\(selectedKid.user_name)")
            Text("\(selectedKid._id)")
            }.padding(.all)
            
        }
    }
}

struct KidPlayView_Previews: PreviewProvider {
    static var previews: some View {
        KidsView()
    }
}
