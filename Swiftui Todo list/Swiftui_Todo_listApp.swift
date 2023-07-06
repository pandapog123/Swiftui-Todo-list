//
//  Swiftui_Todo_listApp.swift
//  Swiftui Todo list
//
//  Created by Dan I on 7/6/23.
//

import SwiftUI

@main
struct Swiftui_Todo_listApp: App {
    @State var currentTodos = Todos(todos: [])

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(currentTodos)
        }
    }
}
