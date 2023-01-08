//
//  prueba_ceibaApp.swift
//  prueba_ceiba
//
//  Created by andres padilla on 8/01/23.
//

import SwiftUI

@main
struct prueba_ceibaApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
