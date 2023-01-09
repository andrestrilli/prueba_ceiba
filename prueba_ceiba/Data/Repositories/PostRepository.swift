//
//  PostRepository.swift
//  prueba_ceiba
//
//  Created by andres padilla on 9/01/23.
//

import Foundation
class PostRepository {
    
    //Singleton Class
    private init() {}
    static let repository = PostRepository()
    
    
    //Variables Reactivas
   // @Published var users:[User] = []
    
    
    
    //
    private var getPostsRequest = GetPostRequest()
    
    func getPostByUser(idUser:String) async -> [Post] {
        
        return await self.getPostsRequest.request(idUser:idUser)
        
    }
    
}
