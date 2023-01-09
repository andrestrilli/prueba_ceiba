//
//  GetUsers.swift
//  prueba_ceiba
//
//  Created by andres padilla on 8/01/23.
//

import Foundation
import Alamofire

class GetUsers {
    
    private let method:HTTPMethod = .get
    private let headers:HTTPHeaders = [:]
    private let encoding:URLEncoding = .default
    private let route:String = Constants.API_URL + "/users"

    public func request() async -> GetUserResponse{
        
            
        let result = await AF.request(route).validate().serializingData().result
        
        switch(result){
            
        case .success(let data):
            let info = try? JSONDecoder().decode(GetUserResponse.self, from: data)
            return info ?? [];
            
        case .failure(let error ):
            //Manage Error
            return [];
            
        }
        
        
    }
    
    
    
    
    
}
