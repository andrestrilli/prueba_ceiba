//
//  ItemUser.swift
//  prueba_ceiba
//
//  Created by andres padilla on 8/01/23.
//

import SwiftUI

struct ItemUserView: View {
    
    var user:User
    
    var name = ""
    var phone = "239234234"
    var email = "239234234"
    
    init(user:User){
        self.user = user
        self.name = user.name ?? ""
        self.email = user.email ?? ""
        self.phone = user.phone ?? ""

    }


    var body: some View {
        VStack(alignment:.leading){
            Text(self.name).font(.headline).foregroundColor(Color.accentColor)
            cellphone
            mail
            see_posts
        }.padding(8).background(Color.white)
    }
    
    var cellphone: some View{
        HStack(){
            Image(systemName: "phone.fill").foregroundColor(Color.accentColor)
            Text(self.phone).foregroundColor(Color.black)
        }.padding(4)
    }
    
    var mail: some View{
        HStack(){
            Image(systemName: "envelope.fill").foregroundColor(Color.accentColor)
            Text(self.email).foregroundColor(Color.black)
        }.padding(4)
    }
    
    var see_posts: some View{
        HStack(){
            Spacer()
            Text("Ver publicaciones").foregroundColor(Color.accentColor)
        }.padding(4)
    }
}

struct ItemUserView_Previews: PreviewProvider {
    

    static var previews: some View {
        ItemUserView(user: User(id: 1, name: "Leanne Graham", username: "Bret", email: "Sincere@april.biz", address: Address(street: "Kulas Light", suite: "Apt. 556", city: "Gwenborough", zipcode: "92998-3874", geo: Geo(lat: "-37.3159", lng: "81.1496")), phone: "1-770-736-8031 x56442", website: "hildegard.org", company: Company(name: "Romaguera-Crona", catchPhrase: "Multi-layered client-server neural-net", bs: "harness real-time e-markets")))
    }
    
//    func getUser() -> User {
//        let address = Address(street: "Kulas Light", suite: "Apt. 556", city: "Gwenborough", zipcode: "92998-3874", geo: Geo(lat: "-37.3159", lng: "81.1496"))
//
//        let company = Company(name: "Romaguera-Crona", catchPhrase: "Multi-layered client-server neural-net", bs: "harness real-time e-markets")
//
//        let user = User(id: 1, name: "Leanne Graham", username: "Bret", email: "Sincere@april.biz", address: address, phone: "1-770-736-8031 x56442", website: "hildegard.org", company: company)
//        return user
//    }
}
