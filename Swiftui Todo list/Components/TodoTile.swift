//
//  TodoTile.swift
//  Swiftui Todo list
//
//  Created by Dan I on 7/8/23.
//

import SwiftUI

struct TodoTile: View {
    var todo: Todo
    
    var onCheck: (Bool) -> Void
    
    init(todo: Todo, onCheck: @escaping (Bool) -> Void) {
        self.todo = todo
        self.onCheck = onCheck
    }
    
    var body: some View {
        HStack {
            CustomCheckbox(defaultChecked: todo.checked, onCheck: onCheck)
                .frame(width: 20)
            
            Text(todo.content)
        }
    }
}

struct TodoTile_Previews: PreviewProvider {
    static var previews: some View {
        let currentTodos = Todos(todos: [])
        
        ContentView()
            .environmentObject(currentTodos)
    }
}
