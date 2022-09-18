//
//  ReviewsList.swift
//  SmartKids
//
//  Created by Atsuko Kuwahara on 2022-09-11.
//

import SwiftUI

struct ReviewsList: View {
    @EnvironmentObject var kidVM: KidViewModel
    var menuList = MenuModel().menu
    var body: some View {
        
        
            
        List(menuList) { menuItem in
            ReviewRow(menuItem: menuItem)
  
//    func delete(at offsets: IndexSet){
//        .remove(atOffsets: offsets)
        }
    }
}

struct ReviewsList_Previews: PreviewProvider {
    static var previews: some View {
        ReviewsList()
            .environmentObject(KidViewModel())
    }
}
