//
//  KidViewModel.swift
//  SmartKids
//
//  Created by Wu Guo on 2022-09-08.
//

import Foundation

struct KidViewModel{
    
    var kid: Kid
    let id = UUID()
    var _id: String    {
        return kid._id
    }
    var access_token: String{
        return kid.access_token
    }
    var parentId: String{
        return kid.parentId
    }
    var user_name: String {
        return kid.user_name
    }
    var image: String {
        return kid.image
    }
    var points: Int{
        return kid.points
    }
}
