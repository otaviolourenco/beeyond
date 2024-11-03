//
//  beeyondApp.swift
//  beeyond
//
//  Created by Otavio Lourenço on 03/11/2024.
//

import SwiftUI
import Firebase


@main
struct AppNameApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
