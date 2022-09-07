//
//  User.swift
//  SmartKids
//
//  Created by Wu Guo on 2022-09-06.
//

import Foundation

struct User: Codable, CustomStringConvertible{
       
    let _id: String
    let user_name: String
    let email: String
    let password: String
    let image: String
    let parentId: String
    let access_token: String
    
    var description: String{
        "User{" +
                        "user_id='" + _id + "\'" +
                        ", user_name='" + user_name + "\'" +
                        ", email='" + email + "\'" +
                        ", password='" + password + "\'" +
                        ", image='" + image + "\'" +
                        ", parentId='" + parentId + "\'" +
                        ", access_token='" + access_token +
                        "}"
    }
}
