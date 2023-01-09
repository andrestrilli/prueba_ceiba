//
//  HomeView.swift
//  prueba_ceiba
//
//  Created by andres padilla on 8/01/23.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var interactor: Interactor = Interactor()

    
    var body: some View {
        NavigationView {
            VStack(){
                title
                search_bar
                list_users
                Spacer()
            }.padding()
        }
    }
    
    
    var title: some View{
        HStack(){
            Text("Prueba de ingreso").font(.headline).foregroundColor(Color.white).padding()
            Spacer()
        }.background(Color.accentColor).padding(0)
    }
    
    var search_bar: some View{
        VStack(alignment:.leading){
            Text("Buscar Usuario").font(.footnote).foregroundColor(Color.accentColor)
            TextField("", text: self.$interactor.searchText).textFieldStyle(.roundedBorder)
        }.padding(.horizontal)
    }
    
    var list_users: some View{
        VStack(alignment:.center){
            
            if(self.interactor.showLoading){
                LoadingView().padding(.top, 20)
            }else{
                
                if(self.interactor.showListEmpty){
                    
                    Text("List is empty").font(.body).foregroundColor(Color.accentColor).padding()
                    
                }else{
                    
                    List(self.interactor.usersToShow, id: \.id) { user in
                        
                        NavigationLink {
                            DetailView(interactor: DetailView.Interactor(user: user))
                        } label: {
                            ItemUserView(user: user)
                        }
                    }
                }
            }
        }
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
