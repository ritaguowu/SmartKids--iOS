//
//  ReviewRow.swift
//  SmartKids
//
//  Created by Atsuko Kuwahara on 2022-09-11.
//

import SwiftUI

struct ReviewRow: View {
    var menuItem: MenuItem
    var activityPoints = "0"
    
    var body: some View {
        HStack {
            Image("\(menuItem.id)")
                .resizable()
                .frame(width: 50, height: 50)
            Text(menuItem.name)
            
            Spacer()
            Text(activityPoints)
        }
    }
}

struct ReviewRow_Previews: PreviewProvider {
    static var previews: some View {
        ReviewRow(menuItem: MenuModel().menu[0], activityPoints: "0")
    }
}
