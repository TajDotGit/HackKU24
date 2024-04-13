//
//  ContentView.swift
//  HackKU24
//
//  Created by Tajammul Ikhlaas on 4/13/24.
//

import SwiftUI

struct ContentView: View {
    @State private var newTodo = ""
    @State private var todos = ["Buy groceries", "Finish homework", "Call mom"]
    
    var body: some View {
        VStack {
            // Header
            Text("Todo List")
                .font(.title)
                .padding()
            
            // Todo List
            List {
                ForEach(todos, id: \.self) { todo in
                    Text(todo)
                }
                .onDelete(perform: deleteTodo)
            }
            .listStyle(PlainListStyle())
            
            // New Todo Input
            HStack {
                TextField("Enter a new todo", text: $newTodo)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: addTodo) {
                    Text("Add")
                }
                .padding(.horizontal)
            }
            .padding()
        }
    }
    
    func addTodo() {
        guard !newTodo.isEmpty else { return }
        todos.append(newTodo)
        newTodo = ""
    }
    
    func deleteTodo(at offsets: IndexSet) {
        todos.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


