//
//  DonateModel.swift
//  SmartKids
//
//  Created by Atsuko Kuwahara on 2022-09-13.
//

import Foundation
import SwiftUI

struct DonateItem: Identifiable, Hashable {
    var id: Int
    var name: String
    var points: Int
}

struct DonateModel {
    var donate: [DonateItem] = [
        DonateItem(id:300, name: "Khaled", points: 10),
        DonateItem(id:301, name: "Lijun", points: 10),
        DonateItem(id:302, name: "Masoud", points: 10),
        DonateItem(id:303, name: "Wu", points: 10),
        DonateItem(id:304, name: "Hossein", points: 10),
        DonateItem(id:305, name: "Cat", points: 10),
        DonateItem(id:306, name: "Valerii", points: 10),
        DonateItem(id:307, name: "Yong", points: 10),
        DonateItem(id:308, name: "Shobbia", points: 10),
        DonateItem(id:309, name: "Bird", points: 10),
        DonateItem(id:310, name: "Ellen", points: 10),
        DonateItem(id:311, name: "Goldfish", points: 10)
    ]
}
