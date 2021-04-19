//
//  ViewController.swift
//  todo
//
//  Created by Роман Макаров on 17.04.21.
//

import UIKit

class TodosVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - IB Outlets
    @IBOutlet weak var todoTextField: UITextField!
    @IBOutlet weak var prioritySegment: UISegmentedControl!
    @IBOutlet weak var todosTable: UITableView!
    
    // MARK: - Private Properties
    private var todos: [Todo] = []
    
    // MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todosTable.delegate = self
        todosTable.dataSource = self
        
        getTodos()
    }
    
    // MARK: - IB Actions
    @IBAction func addTodo(_ sender: Any) {
        guard let todoText = todoTextField.text, todoTextField.text != "" else {
            // show alert to user
            debugPrint("You must enter a todo label")
            return
        }
        
        NetworkService.shared.addTodo(todo: Todo(label: todoText, priority: prioritySegment.selectedSegmentIndex)) { (todos) in
            self.todoTextField.text = nil
            self.prioritySegment.selectedSegmentIndex = 0
            self.todos = todos.todos
            self.todosTable.reloadData()
        } onError: { (message) in
            // show alert to user
            debugPrint(message)
        }

    }
    
    // MARK: - Private Methods
    private func getTodos() {
        NetworkService.shared.getTodos { (todos) in
            self.todos = todos.todos
            self.todosTable.reloadData()
        } onError: { (message) in
            // show alert to user
            debugPrint(message)
        }

    }
    
    // MARK: - Public Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell") as? TodoCell else { return UITableViewCell() }
        
        cell.updateCell(todo: todos[indexPath.row])
        
        return cell
    }
    
}

