//
//  DOICollectorApp.swift
//  DOICollector
//
//  Created by Jae Seung Lee on 2/15/21.
//

import SwiftUI

@main
struct DOICollectorApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
