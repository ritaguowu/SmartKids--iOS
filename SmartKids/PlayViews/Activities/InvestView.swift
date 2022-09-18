//
//  InvestView.swift
//  FinalProjectDemo
//
//  Created by Atsuko Kuwahara on 2022-08-25.
//

import SwiftUI

struct InvestView: View {
    var menuItem: MenuItem
    var body: some View {
        Text("view: \(menuItem.name)")
    }
}

struct InvestView_Previews: PreviewProvider {
    static var previews: some View {
        InvestView(menuItem: MenuModel().menu[4])
    }
}
