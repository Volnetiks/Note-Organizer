//
//  quicknotesApp.swift
//  quicknotes
//
//  Created by Thomas Béchu on 20/06/2025.
//

import SwiftUI
import SwiftData

@main
struct quicknotesApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView().modelContainer(for: Note.self)
        }
        MenuBarExtra {
            StatusView().modelContainer(for: Note.self)
        } label: {
            Label("Notes", systemImage: "pencil")
        }
        .menuBarExtraStyle(.window)
    }
}
