//
//  KidsappApp.swift
//  Kidsapp
//
//  Created by Jacqueline Kolbe on 28.08.24.
//

import SwiftUI

@main
struct KidsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            StartView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

