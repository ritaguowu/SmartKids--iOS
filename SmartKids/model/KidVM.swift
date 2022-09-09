//
//  KidViewModel.swift
//  SmartKids
//
//  Created by Wu Guo on 2022-09-08.
//

import Foundation

struct KidVM{
    
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

func encodeObjectArray(kids: [Kid], key: String) {
    do {
        let kidsData = try JSONEncoder().encode(kids)
        UserDefaults.standard.set(kidsData, forKey: key)
    } catch {
        print(error.localizedDescription)
    }
}

func decodeObjectArray(key: String) -> [Kid] {
    if let kidsData = UserDefaults.standard.data(forKey: key) {
        do {
            let kidsObjectArray = try JSONDecoder().decode([Kid].self, from: kidsData)
            return kidsObjectArray

        } catch {
            print(error.localizedDescription)
        }
    }
    return []
}
