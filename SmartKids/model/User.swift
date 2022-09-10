//
//  User.swift
//  SmartKids
//
//  Created by Wu Guo on 2022-09-06.
//

import Foundation

struct User: Codable, CustomStringConvertible{
       
    var _id: String
    var user_name: String
    var email: String
    var password: String
    var image: String
    var parentId: String
    var access_token: String

    init(){
        _id = ""
        user_name = ""
        email = ""
        password = ""
        image = ""
        parentId = ""
        access_token = ""
    }
    
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
    func encodeObject(user: User, key: String) {
        do {
            let userData = try JSONEncoder().encode(user)
            UserDefaults.standard.set(userData, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }

    func decodeObject(key: String) -> User {
        if let userData = UserDefaults.standard.data(forKey: key) {
            do {
                let userObject = try JSONDecoder().decode(User.self, from: userData)

                print(userObject.user_name)
                print(userObject.email)
                return userObject

            } catch {
                print(error.localizedDescription)
            }
        }
        return User()
    }
    
    


