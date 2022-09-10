//
//  KidViewModel.swift
//  SmartKids
//
//  Created by Wu Guo on 2022-09-08.
//

import Foundation

class KidViewModel: ObservableObject{
    
    @Published var kid: Kid = Kid()
    @Published var isValidKid = false
    
    func loadKid(kidId: String){
        
        let defaults = UserDefaults.standard
        
        guard let token = defaults.string(forKey: "jwtToken") else{
            return
        }
        
        Webservice_Kid().getKid(token: token, kidId: kidId){ result in
            switch result{
            case .success(let kid):
                print(kid)
                DispatchQueue.main.async {
                    self.kid = kid
                    self.isValidKid = true
                }
            
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }

}
