//
//  BioBlitzApp.swift
//  BioBlitz
//
//  Created by Felipe Silva de Borba on 04/02/23.
//

import SwiftUI

@main
struct BioBlitzApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowStyle(.hiddenTitleBar)
        .windowResizability(.contentSize) // macOS ventura (13) feature
    }
}
