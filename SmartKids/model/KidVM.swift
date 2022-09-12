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
    
    init(kid: Kid){
        self.kid = kid
    }
    
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
        let data = try JSONEncoder().encode(kids)
        UserDefaults.standard.set(data, forKey: key)
    } catch {
        print(error.localizedDescription)
    }
}

func decodeObjectArray(key: String) -> [Kid] {
    if let data = UserDefaults.standard.data(forKey: key) {
        do {
            let objectArray = try JSONDecoder().decode([Kid].self, from: data)
            return objectArray

        } catch {
            print(error.localizedDescription)
        }
    }
    return []
}
