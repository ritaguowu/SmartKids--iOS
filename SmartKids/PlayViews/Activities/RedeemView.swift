//
//  RedeemView.swift
//  FinalProjectDemo
//
//  Created by Atsuko Kuwahara on 2022-08-25.
//

import SwiftUI

struct RedeemView: View {
    @EnvironmentObject var kidVM: KidViewModel
    var menuItem: MenuItem
    var body: some View {
        RedeemGrid()
    }
}

struct RedeemView_Previews: PreviewProvider {
    static var previews: some View {
        RedeemView(menuItem: MenuModel().menu[3])
            .environmentObject(KidViewModel())
    }
}
