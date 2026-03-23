//
//  ContentView.swift
//  tasktap
//
//  Created by Fikrah Damar Huda on 18/03/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        TabView {
            Text("hello swift")
                .tabItem {
                    Label("Tasks", systemImage: "list.bullet")
                }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
