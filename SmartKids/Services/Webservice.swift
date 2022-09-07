//
//  Webservice.swift
//  SmartKids
//
//  Created by Wu Guo on 2022-09-06.
//

import Foundation

enum AuthenticationError: Error{
    case invalidCredentials
    case custom(errorMessage: String)
}

struct LoginRequestBody: Codable{
    let email: String
    let password: String
}

struct LoginResponse: Codable{
    let success: String?
    let user: User?
}

class Webservice{
    func login(email: String, password: String, completion: @escaping (Result<User, AuthenticationError>) -> Void){
        
        guard let url = URL(string: "http://192.168.31.235:5000/api/v1/auth") else{
            completion(.failure(.custom(errorMessage: "URL is not correct")))
            return
        }
        
        let body = LoginRequestBody(email: email, password: password)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request){(data, response, error) in
            guard let data = data, error == nil else{
                completion(.failure(.custom(errorMessage: "No data")))
                return
            }
            
            guard let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data) else{
                completion(.failure(.invalidCredentials))
                return
            }
            
            guard let user = loginResponse.user else{
                completion(.failure(.invalidCredentials))
                return
            }
            
            completion(.success(user))
            
        }.resume()
        
    }
    
}
