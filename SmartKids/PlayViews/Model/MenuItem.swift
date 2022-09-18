//
//  MenuItem.swift
//  FinalProjectDemo
//
//  Created by Atsuko Kuwahara on 2022-08-22.
//

import Foundation
import SwiftUI

struct MenuItem: Identifiable {
    var id: Int
    var name: String
    
//    private var imageName: String
//    var image: Image {
//        Image(imageName)
//    }
}

struct MenuModel {
    var menu: [MenuItem] = [
        MenuItem(id:0, name: "Daily Task"),
        MenuItem(id:1, name: "Math Quiz 1"),
        MenuItem(id:2, name: "Math Quiz 2"),
        MenuItem(id:3, name: "Redeem your prize"),
        MenuItem(id:4, name: "Donate for love"),
       // MenuItem(id:4, name: "Invest points"),
        MenuItem(id:5, name: "Reviews"),
        MenuItem(id:6, name: "Exit")
    ]
}
