//
//  CircleImage.swift
//  FinalProjectDemo
//
//  Created by Atsuko Kuwahara on 2022-08-25.
//

import SwiftUI

struct CircleImage: View {
    @EnvironmentObject var kidVM: KidViewModel
    //var selectedKid: Kid
    var body: some View {
        Image(kidVM.kid.image)
            .resizable()
            .frame(width: 100, height: 100, alignment: .center)
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.gray, lineWidth: 4)
                Text(kidVM.kid.user_name)
                    .bold()
                    .foregroundColor(Color.white)
                    .offset(y: 40)

            }
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    
    static var previews: some View {
        CircleImage()
            .environmentObject(KidViewModel())
    }
}
