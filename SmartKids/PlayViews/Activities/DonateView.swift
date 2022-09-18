//
//  DonateView.swift
//  FinalProjectDemo
//
//  Created by Atsuko Kuwahara on 2022-08-25.
//

import SwiftUI

struct DonateView: View {
    var menuItem: MenuItem
    var body: some View {
        Text("view: \(menuItem.name)")
    }
}

struct DonateView_Previews: PreviewProvider {
    static var previews: some View {
        DonateView(menuItem: MenuModel().menu[4])
    }
}
