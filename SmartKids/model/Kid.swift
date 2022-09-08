//
//  Kid.swift
//  SmartKids
//
//  Created by Wu Guo on 2022-09-07.
//

import Foundation

struct Kid: Codable, CustomStringConvertible{
    var _id: String
    var access_token: String
    var image: String
    var parentId: String
    var points: Int
    var user_name: String
    
    var description: String{
        "User{" +
            "user_id='" + _id + "\'" +
            ", user_name='" + user_name + "\'" +
            ", image='" + image + "\'" +
            ", parentId='" + parentId + "\'" +
            ", access_token='" + access_token +
            ", points ='" + String(points) +
            "}"
    }
}





struct KidsResponse: Codable {
    var user: [Kid] = Array()

}
