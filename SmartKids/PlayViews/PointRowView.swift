//
//  PointRowView.swift
//  FinalProjectDemo
//
//  Created by Atsuko Kuwahara on 2022-08-21.
//

import SwiftUI

struct PointRowView: View {
    
    //@StateObject var kidVM = KidViewModel()
    @EnvironmentObject var kidVM: KidViewModel
    
    @Binding var bigPoints: Int

    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .stroke(.blue, lineWidth: 5)
            .frame(width: 150, height: 60)
            .overlay(
                HStack(alignment: .center) {
                    Image("point")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 50)
                    Spacer()
                    Text("\(bigPoints)")
                        
                        .font(.system(size: 30, weight: .bold))
                }
                    .padding()
                    
            ).background(.white)
    }
    
}



struct PointRowView_Previews: PreviewProvider {
    
    static var previews: some View {
        PointRowView(bigPoints: .constant(0))
            .environmentObject(KidViewModel())
    }
}
