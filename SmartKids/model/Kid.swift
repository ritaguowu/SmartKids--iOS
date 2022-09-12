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
    
    init(){
        _id = ""
        user_name = ""
        image = ""
        parentId = ""
        points = 0
        access_token = ""
    }
    
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


func encodeKidObject(kid: Kid, key: String) {
    do {
        let kidData = try JSONEncoder().encode(kid)
        UserDefaults.standard.set(kidData, forKey: key)
    } catch {
        print(error.localizedDescription)
    }
}

func decodeKidObject(key: String) -> Kid {
    if let kidData = UserDefaults.standard.data(forKey: key) {
        do {
            let kidObject = try JSONDecoder().decode(Kid.self, from: kidData)

            return kidObject

        } catch {
            print(error.localizedDescription)
        }
    }
    return Kid()
}
