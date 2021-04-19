//
//  Todo.swift
//  todo
//
//  Created by Роман Макаров on 17.04.21.
//

import Foundation

struct Todos: Codable {
    let todos: [Todo]
}

struct Todo: Codable {
    let label: String
    let priority: Int
}
