//
//  KidsListViewModel.swift
//  SmartKids
//
//  Created by Wu Guo on 2022-09-07.
//

import Foundation

class KidsListViewModel: ObservableObject{
    
    @Published var kids: [KidVM] = []
    
    func getAllKids(){
        let defaults = UserDefaults.standard
        
        guard let parentId = defaults.string(forKey: "parentId") else{
            return
        }
        
        guard let token = defaults.string(forKey: "jwtToken") else{
            return
        }
        
        Webservice_Parent().getAllKids(token: token, parentId: parentId ){
            (result) in
            switch result{
            case .success(let kids):
                print(kids)
                DispatchQueue.main.async {
                    self.kids = kids.map(KidVM.init)
                    encodeObjectArray(kids: kids, key: "Kids")
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
        
        Webservice_Parent().getParent(token: token, parentId: parentId){ result in
            
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
    
    //For Reference in the future
    func addKidToList(_ kidvm: Kid){
        var sameKid: Bool = false
        for kidTemp in kids{
            if (kidTemp.user_name == kidvm.user_name){
                sameKid = true
                break;
            }
        }
        if (!sameKid){
            kids.append(KidVM(kid: kidvm))
        }
    }
    
}
