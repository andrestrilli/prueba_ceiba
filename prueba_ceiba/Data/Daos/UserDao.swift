//
//  UserDao.swift
//  prueba_ceiba
//
//  Created by andres padilla on 9/01/23.
//

import Foundation
import CoreData

class UserDao{
    
    private let container : NSPersistentContainer!
    
    init(container : NSPersistentContainer){
        self.container = container
    }
    
    
    func getAll() -> [User] {
        let fetchRequest : NSFetchRequest<UserModel> = UserModel.fetchRequest()
        do {
            let result = try container.viewContext.fetch(fetchRequest)
            return UserModel.toUserArray(users: result)
        } catch {
            print("El error obteniendo person \(error)")
        }
        return []
    }
    
    func insert(users:[User]) {
        let context = container.viewContext
        
        for user in users {

            let userModel = UserModel(context: context)
            userModel.id = String(user.id ?? 0)
            userModel.name = user.name
            userModel.username = user.username
            userModel.phone = user.phone
            userModel.website = user.website
            userModel.email = user.email
            
            do {
                try context.save()
    //            context.reset()
            } catch let error {
                print("Error saving User")
                print(error)
            }
            
        }

    }
    
    
    
    
    
}

extension UserModel{
    
    func toUser() -> User {
        var user = User(id: Int(self.id ?? "0") ?? 0, name: self.name, username: self.username, email: self.email, address: nil, phone: self.phone, website: self.website, company: nil)
        return user
    }
    
    
    static func toUserArray(users:[UserModel]) -> [User] {
        var aux:[User] = []
        for user in users {
            aux.append(user.toUser())
        }
        return aux
    }
    
}
