//
//  currencyApp.swift
//  currency
//
//  Created by Roman Dovgii on 6/16/23.
//

import SwiftUI

@main
struct currencyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
