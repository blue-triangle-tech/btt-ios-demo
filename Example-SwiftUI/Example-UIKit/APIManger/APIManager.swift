//
//  APIManager.swift
//
//  Created by Admin on 22/06/23.
//  Copyright © 2023 Blue Triangle. All rights reserved.
//

import Foundation
import Service

class APIManager {
    
    static let shared = APIManager()
        
    func request(completionHandler: @escaping (Result<[Product], Error>) -> Void) {
        
        guard let url = URL(string: APIPath.product) else {
            completionHandler(.failure(Error.self as! Error))
            return
        }
        
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data,error == nil else {
                completionHandler(.failure(error!))
                return
            }
            
            guard let response = response as? HTTPURLResponse,200..<299 ~= response.statusCode else {
                completionHandler(.failure(error!))
                return
            }
            
            do {
                let json =  try JSONDecoder().decode([Product].self, from: data)
                print(json)
                completionHandler(.success(json))
            } catch {
                completionHandler(.failure(error))
            }
            
        }.resume()
    }
    
}
