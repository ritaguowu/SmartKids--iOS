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
    @Published var isDeleted = false
    @Published var kidName: String = ""
    
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
    
   
    func deleteKid(kidId: String){
        
        let defaults = UserDefaults.standard
        
        guard let token = defaults.string(forKey: "jwtToken") else{
            return
        }
        
        Webservice_Kid().deleteKid(token: token, kidId: kidId){ result in
            switch result{
            case .success(let kid):
                print(kid)
                DispatchQueue.main.async {
                    self.isDeleted = true
                }
            
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
    
    
    func addKid(kidName: String){
        
        let defaults = UserDefaults.standard
        
        guard let parentId = defaults.string(forKey: "parentId") else{
            return
        }
        
        guard let token = defaults.string(forKey: "jwtToken") else{
            return
        }
        
        Webservice_Kid().addKid(token: token,kidName: kidName, parentId: parentId){ result in
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
