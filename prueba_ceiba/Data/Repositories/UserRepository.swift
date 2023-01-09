//
//  UserRepository.swift
//  prueba_ceiba
//
//  Created by andres padilla on 8/01/23.
//

import Foundation
class UserRepository:ObservableObject{
    
    //Singleton Class
    private init() {}
    static let repository = UserRepository()
    
    
    
    //Variables Reactivas
    @Published var users:[User] = []
    
    
    
    //
    private var persistence = PersistenceController()
    private var getUsersRequest = GetUsers()
    
    func getUsers() async -> [User] {
        
        self.users = self.persistence.employeeDao.getAll()
        
        if(self.users.isEmpty){
            self.users = await self.getUsersRequest.request()
            self.saveUsers(users: self.users)
        }
        return self.users
    }
    
    
    func saveUsers(users:[User]) {
        
        self.persistence.employeeDao.insert(users: users)
        
    }
    
}
