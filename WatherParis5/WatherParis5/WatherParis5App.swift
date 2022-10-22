//
//  WatherParis5App.swift
//  WatherParis5
//
//  Created by juanfu on 22/10/22.
//

import SwiftUI

@main
struct WatherParis5App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
