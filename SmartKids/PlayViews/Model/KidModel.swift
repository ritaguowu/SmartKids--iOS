//
//  KidModel.swift
//  SmartKids
//
//  Created by Atsuko Kuwahara on 2022-09-12.
//

import Foundation

struct KidItem: Identifiable, Hashable {
    var id: Int
    var name: String
    var points: Int
}


class KidModel: ObservableObject {
    
    @Published var kidPoints: [KidItem] = []
}
