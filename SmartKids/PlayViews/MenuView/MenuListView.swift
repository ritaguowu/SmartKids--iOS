//
//  MenuListView.swift
//  FinalProjectDemo
//
//  Created by Atsuko Kuwahara on 2022-08-22.
//

import SwiftUI

struct MenuListView: View {
    var menuList = MenuModel().menu
    
    @Binding var bigPoints : Int
    
    var body: some View {
        VStack {
            NavigationView {
                List(menuList) { menuItem in
                    NavigationLink {
                        MenuDetail(menuItem: menuItem, bigPoints: self.$bigPoints)
                    } label: {
                        MenuRowView(menuItem: menuItem)
                    }
//                    .edgesIgnoringSafeArea(.top)
                }
                .navigationTitle("Menu")
                
            }.environment(\.colorScheme, .light)
                .ignoresSafeArea(edges: .top)
        }
    }
}

struct MenuListView_Previews: PreviewProvider {
    static var previews: some View {
        MenuListView( bigPoints: .constant(0))
            .previewInterfaceOrientation(.portrait)
    }
}
