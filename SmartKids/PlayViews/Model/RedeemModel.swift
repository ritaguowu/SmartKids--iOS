//
//  RedeemModel.swift
//  FinalProjectDemo
//
//  Created by Atsuko Kuwahara on 2022-09-04.
//

import Foundation
import SwiftUI

struct RedeemItem: Identifiable, Hashable {
    var id: Int
    var name: String
    var points: Int
    
}

struct RedeemModel {
    var redeem: [RedeemItem] = [
        RedeemItem(id:200, name: "Skate Shoes", points: 10),
        RedeemItem(id:201, name: "Cap", points: 6),
        RedeemItem(id:202, name: "Plant", points: 3),
        RedeemItem(id:203, name: "Cute T-shirt", points: 5),
        RedeemItem(id:204, name: "Stationary", points: 5),
        RedeemItem(id:205, name: "Teddy Bear", points: 6),
        RedeemItem(id:206, name: "Bag", points: 12),
        //RedeemItem(id:207, name: "Shoes", points: 8),
        RedeemItem(id:208, name: "Bouquet", points: 7),
        RedeemItem(id:209, name: "Ring", points: 10),
        RedeemItem(id:210, name: "Notebook", points: 5),
        RedeemItem(id:211, name: "Candy", points: 1),
        RedeemItem(id:212, name: "Mitten", points: 3),
        //RedeemItem(id:213, name: "Soccer Ball", points: 8),
        RedeemItem(id:214, name: "Puzzle", points: 5),
        RedeemItem(id:215, name: "Sneakers", points: 12),
        RedeemItem(id:216, name: "Hatena", points: 15)
    ]
}

