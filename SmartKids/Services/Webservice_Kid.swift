//
//  Webservice_Kid.swift
//  SmartKids
//
//  Created by Wu Guo on 2022-09-08.
//

import Foundation


class Webservice_Kid{
    
    func getKid(token: String, kidId: String, completion: @escaping (Result<Kid, NetworkError>) -> Void){
        let urlString = "http://192.168.31.235:5000/api/v1/kid?kidId=" + kidId
        
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
            

            guard let kid = try? JSONDecoder().decode(Kid.self, from: data) else{
                completion(.failure(.decodingError))
                return
            }
            
            
            completion(.success(kid))
            
        }.resume()
    }
    

}
