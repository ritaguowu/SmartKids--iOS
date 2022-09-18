//
//  ExitView.swift
//  FinalProjectDemo
//
//  Created by Atsuko Kuwahara on 2022-08-25.
//

import SwiftUI

struct ExitView: View {
    var menuItem: MenuItem
    var body: some View {
        VStack {
            Text("view: \(menuItem.name)")
            
            Text("GOOD BYE!!")
        }
    }
}

struct ExitView_Previews: PreviewProvider {
    static var previews: some View {
        ExitView(menuItem: MenuModel().menu[6])
    }
}
