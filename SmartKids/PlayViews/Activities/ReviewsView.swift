//
//  ReviewsView.swift
//  FinalProjectDemo
//
//  Created by Atsuko Kuwahara on 2022-08-25.
//

import SwiftUI

struct ReviewsView: View {
    var menuItem: MenuItem
    var body: some View {
        Text("view: \(menuItem.name)")
        
    }
}

struct ReviewsView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewsView(menuItem: MenuModel().menu[5])
    }
}
