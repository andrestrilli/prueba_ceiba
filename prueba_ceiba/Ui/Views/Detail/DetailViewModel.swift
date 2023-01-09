//
//  DetailViewModel.swift
//  prueba_ceiba
//
//  Created by andres padilla on 9/01/23.
//

import Foundation
import Foundation
import Combine

class DetailViewModel {
    @Published var uiState:UiState?
    var postRepository:PostRepository

    
    init(){
        self.postRepository = PostRepository.repository
       
    }
    
    
    func getPostByUser(user:User) async -> [Post] {
        self.uiState = UiState(watingResponse: true)
        
        let posts = await self.postRepository.getPostByUser(idUser: String(user.id ?? 0))
        
        self.uiState = UiState(watingResponse: false, posts: posts)
        
        return posts

    }
    
    
    
    struct UiState{
        var watingResponse: Bool = false
        var posts:[Post] = []
    }
    
    
}
