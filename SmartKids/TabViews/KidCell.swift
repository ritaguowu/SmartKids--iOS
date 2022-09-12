//
//  KidCell.swift
//  SmartKids
//
//  Created by Wu Guo on 2022-09-09.
//

import SwiftUI

struct KidCell: View {
    
    let kid: Kid
    
    var body: some View {
        HStack{
            Image("default_kid")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 70)
                .clipShape(Circle())

            Text("\(kid.user_name)")
                .foregroundColor(Color.white)
        }.padding(.leading)
    }
}

//struct KidCell_Previews: PreviewProvider {
//    static var previews: some View {
//        KidCell(kid: Kid)
//    }
//}
