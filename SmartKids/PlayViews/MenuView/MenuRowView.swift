//
//  MenuRowView.swift
//  FinalProjectDemo
//
//  Created by Atsuko Kuwahara on 2022-08-22.
//

import SwiftUI

struct MenuRowView: View {
    var menuItem: MenuItem
    
    var body: some View {
        HStack {
            Image("\(menuItem.id)")
                .resizable()
                .frame(width: 50, height: 50)
            Text(menuItem.name)
            
            Spacer()
        }
    }
}

struct MenuRowView_Previews: PreviewProvider {
    static var previews: some View {
        MenuRowView(menuItem: MenuModel().menu[0])
    }
}
