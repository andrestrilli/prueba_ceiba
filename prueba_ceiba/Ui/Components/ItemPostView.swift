//
//  ItemPost.swift
//  prueba_ceiba
//
//  Created by andres padilla on 9/01/23.
//

import SwiftUI

struct ItemPostView: View {
    
    var title = ""
    var description = ""

    init(title: String = "", description: String = "") {
        self.title = title
        self.description = description
    }
    
    var body: some View {
        VStack(alignment: .leading){
            Text(self.title).font(.headline).foregroundColor(Color.accentColor).padding(.vertical,8)
            Text(self.description).foregroundColor(Color.black)
        }.padding(8)
    }
}

struct ItemPostView_Previews: PreviewProvider {
    static var previews: some View {
        ItemPostView(title: "qui est esse", description: "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla")
    }
}
