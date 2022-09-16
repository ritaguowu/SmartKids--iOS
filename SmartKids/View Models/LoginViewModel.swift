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
    @Published var perant: User?
    @Published var showErrorMessage = false
    
    //UI notification
    @Published var isAuthenticated: Bool = false
    @Published var isUpdated: Bool = false
    
    @Published var isLoggedIn: Bool{
        didSet{
        UserDefaults.standard.set(isLoggedIn, forKey: "login")
            }
        }
        
    init(){
        self.isLoggedIn = false
    }
            
        
    func login(){
        
        let defaults = UserDefaults.standard
        
        Webservice_Parent().signIn(email: email, password: password){ result in
            
            switch result{
                case .success(let user):
                    print(user)
                    defaults.setValue(user.access_token, forKey: "jwtToken")
                    defaults.setValue(user._id, forKey: "parentId")
      
                    //Switch back to main thread
                    DispatchQueue.main.async {
                        self.isAuthenticated = true
                        self.isLoggedIn = true
                        
                        self.perant = user
                        
                        encodeObject(user: user, key: "parent")
                    
                    }
                
        
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.showErrorMessage = true
                    }
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
                    self.isAuthenticated = true
                    self.isLoggedIn = true
                    
                    self.perant = user
                    
                    encodeObject(user: user, key: "parent")
                }
                
        
                case .failure(let error):
                    print(error.localizedDescription)
            }
            
        }
    }
    
    func updateParent(userNew: User){
    
        let defaults = UserDefaults.standard
        
        guard let token = defaults.string(forKey: "jwtToken") else{
            return
        }
        
        Webservice_Parent().updateParent(token: token, userNew: userNew ){ result in
            
            switch result{
                case .success(let user):
                print(user)

                //Switch back to main thread
                DispatchQueue.main.async {
                    self.isUpdated = true
                    
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
