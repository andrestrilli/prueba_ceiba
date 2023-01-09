//
//  GetPostsRequest.swift
//  prueba_ceiba
//
//  Created by andres padilla on 9/01/23.
//

import Foundation
import Alamofire

class GetPostRequest {
    
    private let method:HTTPMethod = .get
    private let headers:HTTPHeaders = [:]
    private let encoding:URLEncoding = .default
    private let route:String =  Constants.API_URL + "/posts"

    public func request(idUser:String) async -> GetPostsResponse{
        
        let parameters = ["userId":idUser]
        
        let result = await AF.request(route,parameters:parameters).validate().serializingData().result
        
        switch(result){
            
        case .success(let data):
            let info = try? JSONDecoder().decode(GetPostsResponse.self, from: data)
            return info ?? [];
            
        case .failure(let error ):
            //Manage Error
            return [];
            
        }
        
        
    }
    
}
