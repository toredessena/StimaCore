//
//  StimaCoreApp.swift
//  StimaCore
//
//  Created by salvatore dessena on 19/02/22.
// version 1.2

import SwiftUI

@main
struct StimaCoreApp: App {
    let persistenceController = PersistenceController.shared
    
    @AppStorage("isDarkMode") var isDarkMode: Bool = false

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }

}
