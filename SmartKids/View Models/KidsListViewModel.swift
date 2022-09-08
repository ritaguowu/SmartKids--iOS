//
//  KidsListViewModel.swift
//  SmartKids
//
//  Created by Wu Guo on 2022-09-07.
//

import Foundation

class KidsListViewModel: ObservableObject{
    
    @Published var kids: [KidViewModel] = []
    
    func getAllKids(){
        let defaults = UserDefaults.standard
        
        guard let parentId = defaults.string(forKey: "parentId") else{
            return
        }
        
        guard let token = defaults.string(forKey: "jwtToken") else{
            return
        }
        
        Webservice().getAllKids(token: token, parentId: parentId ){
            (result) in
            switch result{
            case .success(let kids):
                print(kids)
                DispatchQueue.main.async {
                    self.kids = kids.map(KidViewModel.init)
                }
            
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    func getParent(){
    
        let defaults = UserDefaults.standard
        
        guard let parentId = defaults.string(forKey: "parentId") else{
            return
        }
        
        guard let token = defaults.string(forKey: "jwtToken") else{
            return
        }
        
        Webservice().getParent(token: token, parentId: parentId){ result in
            
            switch result{
                case .success(let user):
                print(user)

                //Switch back to main thread
                DispatchQueue.main.async {
//                    self.isAuthenticated = true
                }
                
        
                case .failure(let error):
                    print(error.localizedDescription)
            }
            
        }
    }
    
}
