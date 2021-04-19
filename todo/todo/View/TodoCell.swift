//
//  TodoCell.swift
//  todo
//
//  Created by Роман Макаров on 17.04.21.
//

import UIKit

class TodoCell: UITableViewCell {

    // MARK: - IB Outlets
    @IBOutlet weak var todoLabel: UILabel!
    @IBOutlet weak var priorityView: UIView!
    
    // MARK: - Public Methods
    func updateCell(todo: Todo) {
        todoLabel.text = todo.label
        
        switch todo.priority {
        case 0:
            priorityView.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
            break
        case 1:
            priorityView.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
            break
        default:
            priorityView.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        }
    }

}
