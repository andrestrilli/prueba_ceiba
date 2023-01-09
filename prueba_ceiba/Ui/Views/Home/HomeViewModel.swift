//
//  ViewModel.swift
//  prueba_ceiba
//
//  Created by andres padilla on 8/01/23.
//

import Foundation
import Combine

class HomeViewModel {
    
    @Published var uiState:UiState?


    var userRepository:UserRepository
    var anyCancellable : AnyCancellable? = nil

    
    init(){
        self.userRepository = UserRepository.repository
        
        self.anyCancellable = self.userRepository.$users.sink(receiveValue: { users in
            self.uiState = UiState(watingResponse: false, users: users)
        })
    }
    
    
    func getUsers() async -> [User] {
        self.uiState = UiState(watingResponse: true)
        return await self.userRepository.getUsers()
    }
    
    
    
    struct UiState{
        var watingResponse: Bool = false
        var users:[User] = []
    }
    
}
