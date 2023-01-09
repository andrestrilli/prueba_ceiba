//
//  LoadingView.swift
//  prueba_ceiba
//
//  Created by andres padilla on 9/01/23.
//

import SwiftUI

struct LoadingView: View {
    
    @State private var isLoading = false

    var body: some View {
        VStack(){
            Text("Loading Data")
                .font(.system(.body, design: .rounded))
                .bold()
 
            ZStack {
             

                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color(.systemGray5), lineWidth: 3)
                            .frame(width: 250, height: 3)
             
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color.accentColor, lineWidth: 3)
                            .frame(width: 30, height: 3)
                            .offset(x: isLoading ? 110 : -110, y: 0)
                            .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                    }
                    .onAppear() {
                        self.isLoading = true
                    }//.border(Color.red)
        }
        
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
