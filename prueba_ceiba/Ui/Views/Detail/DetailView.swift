//
//  DetailView.swift
//  prueba_ceiba
//
//  Created by andres padilla on 9/01/23.
//

import SwiftUI

struct DetailView: View {
    
    @StateObject var interactor: Interactor = Interactor()

    var body: some View {
        VStack(alignment:.leading){
            Text(self.interactor.name).font(.title).foregroundColor(Color.accentColor)
            cellphone
            mail
            posts
            Spacer()
        }.padding(8).background(Color.white)
    }
    
    var cellphone: some View{
        HStack(){
            Image(systemName: "phone.fill").foregroundColor(Color.accentColor)
            Text(self.interactor.phone).foregroundColor(Color.black)
        }.padding(4)
    }
    
    var mail: some View{
        HStack(){
            Image(systemName: "envelope.fill").foregroundColor(Color.accentColor)
            Text(self.interactor.email).foregroundColor(Color.black)
        }.padding(4)
    }
    
    var posts: some View{
        VStack(alignment: .leading){
            Text("Publicaciones").foregroundColor(Color.accentColor)
                    
            List(self.interactor.posts, id: \.id){ post in
                ItemPostView(title: post.title ?? "", description: post.body ?? "")
            }
            
        }.padding(4)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
