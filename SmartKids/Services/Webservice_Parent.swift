//
//  Webservice.swift
//  SmartKids
//
//  Created by Wu Guo on 2022-09-06.
//

import Foundation

public enum AuthenticationError: Error{
    case invalidCredentials
    case custom(errorMessage: String)
}

public enum NetworkError: Error{
    case invalidURL
    case noData
    case decodingError
}

struct RegisterRequestBody: Codable{
    let user_name: String
    let email: String
    let password: String
}

struct LoginRequestBody: Codable{
    let email: String
    let password: String
}

struct userResponse: Codable{
    let success: String?
    let user: User?
}

class Webservice_Parent{
    
    //SignUp
    func signUp(username: String, email: String, password: String, completion: @escaping (Result<User, AuthenticationError>) -> Void){
        
        guard let url = URL(string: "http://192.168.31.235:5000/api/v1/parent") else{
            completion(.failure(.custom(errorMessage: "URL is not correct")))
            return
        }
        
        let body = RegisterRequestBody(user_name: username, email: email, password: password)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request){(data, response, error) in
            guard let data = data, error == nil else{
                completion(.failure(.custom(errorMessage: "No data")))
                return
            }
            
            guard let response = try? JSONDecoder().decode(userResponse.self, from: data) else{
                completion(.failure(.invalidCredentials))
                return
            }
            
            guard let user = response.user else{
                completion(.failure(.invalidCredentials))
                return
            }
            
            completion(.success(user))
            
        }.resume()
        
    }
    
    
    
    //SignIn
    func signIn(email: String, password: String, completion: @escaping (Result<User, AuthenticationError>) -> Void){
        
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
            
            guard let loginResponse = try? JSONDecoder().decode(userResponse.self, from: data) else{
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
    
    
    //Get all kids information
    func getAllKids(token: String, parentId: String, completion: @escaping (Result<[Kid], NetworkError>) -> Void){
        let urlString = "http://192.168.31.235:5000/api/v1/kids?parentId=" + parentId
        print("urlString", urlString)
        print("token", token)
        
        guard let url = URL(string: urlString) else{
            completion(.failure(.invalidURL))
            return
        }
        

        let authorizationKey = "Bearer ".appending(token)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.addValue(authorizationKey, forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request){ (data, response, error) in
            guard let data = data, error == nil else{
                completion(.failure(.noData))
                return
            }
            

            guard let decodedResponse = try? JSONDecoder().decode(KidsResponse.self, from: data) else{
                completion(.failure(.decodingError))
                return
            }
            
            
            print(decodedResponse.user.count)
            var kids: [Kid] = []
            
            if (decodedResponse.user.count > 0){
                for kid in decodedResponse.user{
                    kids.append(kid)
                }
            }

            completion(.success(kids))
            
        }.resume()        
    }
    
    func getParent(token: String, parentId: String, completion: @escaping (Result<User, NetworkError>) -> Void){
        let urlString = "http://192.168.31.235:5000/api/v1/parent?token=" + token + "&parentId=" + parentId
        print("urlString", urlString)
        print("token", token)
        
        guard let url = URL(string: urlString) else{
            completion(.failure(.invalidURL))
            return
        }
        

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
//        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request){ (data, response, error) in
            guard let data = data, error == nil else{
                completion(.failure(.noData))
                return
            }
            
            
            guard let loginResponse = try? JSONDecoder().decode(userResponse.self, from: data) else{
                completion(.failure(.decodingError))
                return
            }
            
            guard let user = loginResponse.user else{
                completion(.failure(.decodingError))
                return
            }
            
            completion(.success(user))
            
        }.resume()
    }
    
    
}
