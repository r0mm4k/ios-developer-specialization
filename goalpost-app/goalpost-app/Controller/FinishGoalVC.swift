//
//  FinishGoalVC.swift
//  goalpost-app
//
//  Created by Роман Макаров on 11.04.21.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class FinishGoalVC: UIViewController, UITextFieldDelegate {
    
    // MARK: - IB Outlets
    @IBOutlet weak var createGoalButton: UIButton!
    @IBOutlet weak var pointsTextField: UITextField!
    
    // MARK: - Private Properties
    private var goalDescription: String!
    private var goalType: GoalType!
    
    // MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pointsTextField.delegate = self

        createGoalButton.bindToKeyboard()
    }

    // MARK: - IB Actions
    @IBAction func createGoalButtonWasPressed(_ sender: Any) {
        guard pointsTextField.text != "" else { return }
        
        self.save { complete in
            if complete {
                dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func backButtonWasPressed(_ sender: Any) {
        dismissDetail()
    }
    
    // MARK: - Public Methods
    func initData(description: String, type: GoalType) {
        self.goalDescription = description
        self.goalType = type
    }
    
    // MARK: - Private Methods
    func save(completion: (_ finished: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        let goal = Goal(context: managedContext)
        
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalComplitionValue = Int32(pointsTextField.text!)!
        goal.goalProgress = Int32(0)
        
        do {
            try managedContext.save()
            completion(true)
        } catch {
            debugPrint("Could not save: \(error.localizedDescription)")
            completion(false)
        }
    }
    
}
