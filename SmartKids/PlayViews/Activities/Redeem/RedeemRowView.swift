//
//  RedeemRowView.swift
//  FinalProjectDemo
//
//  Created by Atsuko Kuwahara on 2022-09-04.
//

import SwiftUI

struct RedeemRowView: View {
    var redeemItem: RedeemItem
    
    var body: some View {
        VStack {
            ZStack {
                Image("\(redeemItem.id)")
                    .resizable()
                    .frame(width: 80, height: 80)
                Text("\(redeemItem.points)P")
                    .frame(width: 100, height: 90, alignment: .topTrailing)
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
            }
            Text(redeemItem.name)
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .medium, design: .rounded))
            //Spacer()
        }
        
        .padding()
    }
}

struct RedeemRowView_Previews: PreviewProvider {
    static var previews: some View {
        RedeemRowView(redeemItem: RedeemModel().redeem[0])
    }
}
