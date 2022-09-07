//
//  LoginViewModel.swift
//  SmartKids
//
//  Created by Wu Guo on 2022-09-06.
//

import Foundation

class LoginViewModel: ObservableObject{
    @Published var email: String = ""
    @Published var password: String = ""
    
    //UI notification
    @Published var isAuthenticated: Bool = false
    
    func login(){
        
        let deaults = UserDefaults.standard
        
        Webservice().login(email: email, password: password){ result in
            
            switch result{
                case .success(let user):
                print(user)
                deaults.setValue(user.access_token, forKey: "jwtToken")
                //Switch back to main thread
                DispatchQueue.main.async {
                    self.isAuthenticated = true
                }
                
        
                case .failure(let error):
                    print(error.localizedDescription)
            }
            
        }
    }
    
}
