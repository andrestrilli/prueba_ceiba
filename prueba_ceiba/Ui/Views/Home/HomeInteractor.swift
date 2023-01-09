//
//  HomeInteractor.swift
//  prueba_ceiba
//
//  Created by andres padilla on 8/01/23.
//

import Foundation
import Combine

extension HomeView{
    
    @MainActor class Interactor:ObservableObject{
        
        @Published var showLoading = true
        
        @Published var showListEmpty = true

        @Published var searchText:String = "" {
            didSet{
                self.doFilter(txt: searchText)
            }
            
        }
        @Published var usersToShow:[User] = []
        var users:[User] = []

        
        private var subcriberViewmodel: AnyCancellable? = nil

        
        private var viewmodel:HomeViewModel
        
        
        init() {
            self.viewmodel = HomeViewModel()
            
            self.subcriberViewmodel = viewmodel.$uiState.sink(receiveValue: { uistate in
                
                DispatchQueue.main.async {
                    if(uistate?.watingResponse ?? false ){
                        self.showLoading = true
                    }else{
                        self.showLoading = false
                    }
                }
                
                self.users = uistate?.users ?? []
                self.doFilter(txt: self.searchText)

            })
            
            Task.init{
               await self.viewmodel.getUsers()
            }
            
        }
        
        func doFilter(txt:String) {
            if(txt.isEmpty){
                DispatchQueue.main.async {
                    self.usersToShow = self.users
                }
            }else{
                self.usersToShow = self.users.filter({ user in
                    (user.name ?? "").lowercased().contains(txt.lowercased())
                })
                
            }
            DispatchQueue.main.async {
                self.showListEmpty = self.usersToShow.isEmpty
            }
        }
        
        
        
        
        
    }
}
