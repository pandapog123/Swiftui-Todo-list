//
//  TodoListView.swift
//  Swiftui Todo list
//
//  Created by Dan I on 7/6/23.
//

import SwiftUI

struct TodoListView: View {
    @EnvironmentObject var todosObj: Todos
    
    @State var showAddSheet = false
    @State var currentContent = ""
    
    func handleAdd() {
        showAddSheet = true
    }
    
    func createTodo() {
        todosObj.addTodo(content: currentContent)
        currentContent = ""
    }
    
    var body: some View {
        NavigationStack {
            List(todosObj.todos) { todo in
                TodoTile(todo: todo) { _ in
                    todosObj.checkTodo(id: todo.id)
                }
                .swipeActions {
                    Button(role: .destructive) {
                        todosObj.removeTodo(id: todo.id)
                    } label: {
                        Image(systemName: "trash")
                    }
                }
            }
            .listStyle(.inset)
            .navigationTitle("Swiftui To-Do List")
            .toolbar {
                ToolbarItem {
                    Button(action: handleAdd) {
                        Image(systemName: "plus")
                    }
                }
            }
            .alert("Log in", isPresented: $showAddSheet) {
                TextField("To-Do Content", text: $currentContent)
               
                Button("Cancel", role: .cancel) { }
                Button("Create", action: createTodo)
            } message: {
                Text("Please enter your to-do's contents")
            }
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        let currentTodos = Todos(todos: [])
        
        ContentView()
            .environmentObject(currentTodos)
    }
}
