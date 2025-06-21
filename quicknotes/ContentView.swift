//
//  ContentView.swift
//  quicknotes
//
//  Created by Thomas Béchu on 20/06/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query(sort: \Note.createdAt) private var notes: [Note]
    @Environment(\.modelContext) private var context
    
    @State private var newNoteName = ""
    @State private var newNoteContent = ""
    
    var body: some View {
        NavigationStack {
            List(notes) { note in
                HStack {
                    Text(note.name)
                    Spacer()
                    Text(note.createdAt, format: .dateTime)
                    Spacer()
                    Text(note.content)
                }
            }
            .navigationTitle("Notes")
            .safeAreaInset(edge: .bottom) {
                VStack(alignment: .center, spacing: 10) {
                    Text("New Note").font(.headline)
                    TextField("Title", text: $newNoteName).textFieldStyle(.roundedBorder)
                    TextField("Content", text: $newNoteContent).textFieldStyle(.roundedBorder)
                    Button("Save") {
                        let newNote = Note(name: newNoteName, content: newNoteContent, createdAt: .now)
                        
                        context.insert(newNote)
                        
                        newNoteName = ""
                        newNoteContent = ""
                    }.bold()
                }
                .padding()
                .background(.bar)
            }
        }
    }
}

#Preview {
    ContentView()
}
