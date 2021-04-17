//
//  GoalCell.swift
//  goalpost-app
//
//  Created by Роман Макаров on 9.04.21.
//

import UIKit

class GoalCell: UITableViewCell {

    // MARK: - IB Outlets
    @IBOutlet weak var goalDescriptionLabel: UILabel!
    @IBOutlet weak var goalTypeLabel: UILabel!
    @IBOutlet weak var goalProgressLabel: UILabel!
    @IBOutlet weak var completionView: UIView!
    
    // MARK: - Public Methods
    func configureCell(goal: Goal) {
        self.goalDescriptionLabel.text = goal.goalDescription
        self.goalTypeLabel.text = goal.goalType
        self.goalProgressLabel.text = String(goal.goalProgress)
        
        if goal.goalProgress == goal.goalComplitionValue {
            self.completionView.isHidden = false
        } else {
            self.completionView.isHidden = true
        }
    }
    
}
