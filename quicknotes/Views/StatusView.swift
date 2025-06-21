//
//  StatusView.swift
//  quicknotes
//
//  Created by Thomas Béchu on 21/06/2025.
//

import SwiftUI
import SwiftData

struct StatusView: View {
    @Environment(\.modelContext) private var context
    
    @State private var textInput: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Add your text below").foregroundStyle(.secondary)
            TextEditor(text: $textInput)
                .padding(.vertical, 4)
                .scrollContentBackground(.hidden)
                .background(.thinMaterial)
            Button("Submit", systemImage: "paperplane") {
                let note = Note(name: "test", content: textInput, createdAt: .now)
                context.insert(note)
                textInput = ""
            }
            .buttonStyle(.plain)
            .foregroundStyle(.blue)
            .bold()
        }
        .padding()
    }
}
