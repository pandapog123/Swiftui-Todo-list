//
//  ContentView.swift
//  Swiftui Todo list
//
//  Created by Dan I on 7/6/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TodoListView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let currentTodos = Todos(todos: [])
        
        ContentView()
            .environmentObject(currentTodos)
    }
}
