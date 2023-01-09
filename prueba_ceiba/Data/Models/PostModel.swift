//
//  PostModel.swift
//  prueba_ceiba
//
//  Created by andres padilla on 9/01/23.
//
//   let post = try? JSONDecoder().decode(Post.self, from: jsonData)

import Foundation

// MARK: - Post
class Post:Decodable {
    var userID, id: Int?
    var title, body: String?

    init(userID: Int?, id: Int?, title: String?, body: String?) {
        self.userID = userID
        self.id = id
        self.title = title
        self.body = body
    }
}
