//
//  LoginViewModel.swift
//  SmartKids
//
//  Created by Wu Guo on 2022-09-06.
//

import Foundation

class LoginViewModel: ObservableObject{
    var email: String = ""
    var password: String = ""
    
    func login(){
        Webservice().login(email: email, password: password){ result in
            
            switch result{
                case .success(let user):
                    print(user)
        
                case .failure(let error):
                    print(error.localizedDescription)
            }
            
        }
    }
    
}
