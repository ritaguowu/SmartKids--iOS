//
//  MenuDetail.swift
//  FinalProjectDemo
//
//  Created by Atsuko Kuwahara on 2022-08-22.
//

import SwiftUI

struct MenuDetail: View {
    var menuItem: MenuItem
    @Binding var bigPoints: Int
    
    var body: some View {
        switch menuItem.name {
        case "Daily Task": DailyTaskView(resultModel: ResultModel(), bigPoints: self.$bigPoints, menuItem: menuItem)
        case "Math Quiz 1": MathQuizView(menuItem: menuItem)
        case "Math Quiz 2": MathQuizTwoView(menuItem: menuItem)
        case "Redeem your prize": RedeemView(menuItem: menuItem)
        case "Donate for love": DonateView(menuItem: menuItem)
        //case "Invest points": InvestView(menuItem: menuItem)
        case "Reviews": ReviewsView(menuItem: menuItem)
        case "Exit": ExitView(menuItem: menuItem)
        default: DailyTaskView(resultModel: ResultModel(), bigPoints: self.$bigPoints, menuItem: menuItem)
            
        }
        
    }
}

struct MenuDetail_Previews: PreviewProvider {
    static var previews: some View {
        MenuDetail(menuItem: MenuModel().menu[0], bigPoints: .constant(0))
            .previewInterfaceOrientation(.landscapeLeft)
            
    }
}
