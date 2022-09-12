//
//  Webservice_Kid.swift
//  SmartKids
//
//  Created by Wu Guo on 2022-09-08.
//

import Foundation

struct LoadKidResponse: Codable{
    let success: String?
    let kid: Kid?
}

struct DeleteKidResponse: Codable{
    let success: String?
}

struct AddKidResponse: Codable{
    let success: String?
    let user: Kid?
}

class Webservice_Kid{
    
    func getKid(token: String, kidId: String, completion: @escaping (Result<Kid, NetworkError>) -> Void){
        let urlString = "http://192.168.31.235:5000/api/v1/kid?kidId=" + kidId
        
        guard let url = URL(string: urlString) else{
            completion(.failure(.invalidURL))
            return
        }
                
        print(urlString)
        print(token)
        
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
            

            guard let loadKidResponse = try? JSONDecoder().decode(LoadKidResponse.self, from: data) else{
                completion(.failure(.decodingError))
                return
            }
            
            guard let kid = loadKidResponse.kid else{
                completion(.failure(.decodingError))
                return
            }
            
            
            completion(.success(kid))
            
        }.resume()
    }
    
    func deleteKid(token: String, kidId: String, completion: @escaping (Result<String, NetworkError>) -> Void){
        let urlString = "http://192.168.31.235:5000/api/v1/kid?kidId=" + kidId
        
        guard let url = URL(string: urlString) else{
            completion(.failure(.invalidURL))
            return
        }
                
        print(urlString)
        print(token)
        
        let authorizationKey = "Bearer ".appending(token)
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.addValue(authorizationKey, forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request){ (data, response, error) in
            guard let data = data, error == nil else{
                completion(.failure(.noData))
                return
            }
            

            guard let deleteResponse = try? JSONDecoder().decode(DeleteKidResponse.self, from: data) else{
                completion(.failure(.decodingError))
                return
            }
            
            guard let result = deleteResponse.success else{
                completion(.failure(.decodingError))
                return
            }
            
            
            completion(.success(result))
            
        }.resume()
    }
    
    
    func addKid(token: String, kidName: String, parentId: String,completion: @escaping (Result<Kid, NetworkError>) -> Void){
        
        let urlString = "http://192.168.31.235:5000/api/v1/kid?kidName=" + kidName + "&parentId=" + parentId
        
        guard let url = URL(string: urlString) else{
            completion(.failure(.invalidURL))
            return
        }
        
        print(urlString)
        
        var request = URLRequest(url: url)
        
        let authorizationKey = "Bearer ".appending(token)
        request.httpMethod = "POST"
        request.addValue(authorizationKey, forHTTPHeaderField: "Authorization")
         
        URLSession.shared.dataTask(with: request){ (data, response, error) in
            guard let data = data, error == nil else{
                completion(.failure(.noData))
                return
            }
            

            guard let addKidResponse = try? JSONDecoder().decode(AddKidResponse.self, from: data) else{
                completion(.failure(.decodingError))
                return
            }
            
            guard let kid = addKidResponse.user else{
                completion(.failure(.decodingError))
                return
            }
            
            
            completion(.success(kid))
            
        }.resume()
    }
    
    

}
