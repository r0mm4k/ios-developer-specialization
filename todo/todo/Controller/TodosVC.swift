//
//  ViewController.swift
//  todo
//
//  Created by Роман Макаров on 17.04.21.
//

import UIKit

class TodosVC: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var todoTextField: UITextField!
    @IBOutlet weak var prioritySegment: UISegmentedControl!
    
    // MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkService.shared.getTodos { (todos) in
            debugPrint(todos)
        }
    }

    // MARK: - IB Actions
    @IBAction func addTodo(_ sender: Any) {
    }
    
}

