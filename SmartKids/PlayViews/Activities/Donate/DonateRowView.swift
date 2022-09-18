//
//  DonateRowView.swift
//  SmartKids
//
//  Created by Atsuko Kuwahara on 2022-09-13.
//

import SwiftUI

struct DonateRowView: View {
    var donateItem: DonateItem
    
    var body: some View {
        VStack {
            ZStack {
                Image("\(donateItem.id)")
                    .resizable()
                    .frame(width: 80, height: 80)
                Text("\(donateItem.points)P")
                    .frame(width: 100, height: 90, alignment: .topTrailing)
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
            }
            Text(donateItem.name)
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .medium, design: .rounded))
            //Spacer()
        }
        
        .padding()
    }
}

struct DonateRowView_Previews: PreviewProvider {
    static var previews: some View {
        DonateRowView(donateItem: DonateModel().donate[0])
    }
}
