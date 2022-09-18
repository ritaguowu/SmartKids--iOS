//
//  KidPlayView.swift
//  SmartKids
//
//  Created by Wu Guo on 2022-09-08.
//

import SwiftUI

struct KidPlayView: View {
    @EnvironmentObject var kidVM: KidViewModel
    
    @State var bigPoints : Int
    
    let selectedKid: Kid

        
    var body: some View {
        VStack(spacing: 0) {
            ContentHeaderView()
                .ignoresSafeArea(edges: .top)

            PointRowView(bigPoints: self.$bigPoints)
                .offset(y: -80)
                .padding(.bottom, -80)

            MenuListView(bigPoints: self.$bigPoints)
            Spacer()

        }
        
        .onAppear(){
            kidVM.loadKid(kidId: selectedKid._id)
        }
       
        
        // kid information:
//        ZStack{
//            VStack{
//            Text("\(kidVM.kid.user_name)")
//            Text("\(kidVM.kid._id)")
//            }.padding(.all)
//
//        }
//        .onAppear(){
//            kidVM.loadKid(kidId: selectedKid._id)
//        }
    }
}

//struct KidPlayView_Previews: PreviewProvider {
//    static var previews: some View {
//        KidPlayView(selectedKid: Kid())
//            .environmentObject(KidViewModel())
//    }
//}
