//
//  ScooterApp.swift
//  Scooter
//
//  Created by Fernando Borrell on 11/18/23.
//

import SwiftUI

@main
struct ScooterApp: App {
    var windowSharedModel = WindowSharedModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(windowSharedModel)
        }
    }
}
