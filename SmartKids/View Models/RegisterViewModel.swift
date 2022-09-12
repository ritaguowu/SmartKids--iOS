//
//  RegisterViewModel.swift
//  SmartKids
//
//  Created by Wu Guo on 2022-09-11.
//

import Foundation

class RegisterViewModel: ObservableObject{
    
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
    @Published var parent: User = User()
    
    @Published var isAuthenticated: Bool = false
    
    func register(){
        
        let defaults = UserDefaults.standard
                
        Webservice_Parent().signUp(username: username, email: email, password: password){ result in
            switch result{
            case .success(let user):
                defaults.setValue(user.access_token, forKey: "jwtToken")
                defaults.setValue(user._id, forKey: "parentId")
  
                //Switch back to main thread
                DispatchQueue.main.async {
                    self.parent = user
                    self.isAuthenticated = true
                    
                    encodeObject(user: user, key: "parent")
                }
            
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }

}
