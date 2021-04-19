//
//  NetworkService.swift
//  todo
//
//  Created by Роман Макаров on 17.04.21.
//

import Foundation

class NetworkService {
    
    static let shared = NetworkService()
    
    let BASE_URL = "http://localhost:3003"
    let TODOS_ENDPOINT = "/todos"
    
    let session = URLSession(configuration: .default)
    
    func getTodos(onSuccess: @escaping (Todos) -> Void, onError: @escaping (String) -> Void) {
        let url = URL(string: "\(BASE_URL)\(TODOS_ENDPOINT)")!
        
        let task = session.dataTask(with: url) { (data, responce, error) in
            DispatchQueue.main.async {
                if let error = error {
                    onError(error.localizedDescription)
                    return
                }
                
                guard let data = data, let responce = responce as? HTTPURLResponse else {
                    onError("Invalid data or responce")
                    return
                }
                
                do {
                    if responce.statusCode == 200 {
                        let todos = try JSONDecoder().decode(Todos.self, from: data)
                        onSuccess(todos)
                    } else {
                        let error = try JSONDecoder().decode(APIError.self, from: data)
                        onError(error.message)
                    }
                } catch {
                    onError(error.localizedDescription)
                }
            }
        }
        
        task.resume()
    }
    
    func addTodo(todo: Todo, onSuccess: @escaping (Todos) -> Void, onError: @escaping (String) -> Void) {
        let url = URL(string: "\(BASE_URL)\(TODOS_ENDPOINT)")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        do {
            let body = try JSONEncoder().encode(todo)
            request.httpBody = body
            
            let task = session.dataTask(with: request) { (data, responce, error) in
                DispatchQueue.main.async {
                    if let error = error {
                        onError(error.localizedDescription)
                        return
                    }
                    
                    guard let data = data, let responce = responce as? HTTPURLResponse else {
                        onError("Invalid data or responce")
                        return
                    }
                    
                    do {
                        if responce.statusCode == 200 {
                            let todos = try JSONDecoder().decode(Todos.self, from: data)
                            onSuccess(todos)
                        } else {
                            let error = try JSONDecoder().decode(APIError.self, from: data)
                            onError(error.message)
                        }
                    } catch {
                        onError(error.localizedDescription)
                    }
                }
            }
            
            task.resume()
        } catch {
            onError(error.localizedDescription)
        }
    }
    
}
