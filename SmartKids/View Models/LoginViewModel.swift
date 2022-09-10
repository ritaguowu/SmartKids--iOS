//
//  LoginViewModel.swift
//  SmartKids
//
//  Created by Wu Guo on 2022-09-06.
//

import Foundation

class LoginViewModel: ObservableObject{
//    @Published var userName:String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var perant: User = User()
    
    //UI notification
    @Published var isAuthenticated: Bool = false
        
    func login(){
        
        let defaults = UserDefaults.standard
        
        Webservice_Parent().signIn(email: email, password: password){ result in
            
            switch result{
                case .success(let user):
//                print(user)
                defaults.setValue(user.access_token, forKey: "jwtToken")
                defaults.setValue(user._id, forKey: "parentId")
  
                //Switch back to main thread
                DispatchQueue.main.async {
                    self.isAuthenticated = true
                    self.perant = user
                    
                    encodeObject(user: user, key: "parent")
                    
                }
                
        
                case .failure(let error):
                    print(error.localizedDescription)
            }
            
        }
    }
    
    
    func signout(){
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "jwtToken")
        defaults.removeObject(forKey: "parentId")
        DispatchQueue.main.async {
            self.isAuthenticated = false
        }
    }
    
}
