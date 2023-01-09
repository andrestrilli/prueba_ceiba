//
//  DetailInteractor.swift
//  prueba_ceiba
//
//  Created by andres padilla on 9/01/23.
//

import Foundation
import Foundation
import Combine

extension DetailView{
    
    @MainActor class Interactor:ObservableObject{
        
        @Published var showLoading = false
        @Published var posts:[Post] = []

        
        var user:User?
        
        var name = ""
        var phone = ""
        var email = ""
        
        private var viewmodel:DetailViewModel = DetailViewModel()
        private var subcriberViewmodel: AnyCancellable? = nil
        
        init() {
            
        }
        
        init(user:User){
            self.user = user
            self.name = user.name ?? ""
            self.email = user.email ?? ""
            self.phone = user.phone ?? ""
            
            self.subcriberViewmodel = viewmodel.$uiState.sink(receiveValue: { uistate in
                
                if(uistate?.watingResponse ?? false ){
                    self.showLoading = true
                }else{
                    self.showLoading = false
                }
                
            })
            
            Task.init(){
                let posts =  await  self.viewmodel.getPostByUser(user: user)
                self.posts = posts
            }

        }
        
        
        
    }
}
