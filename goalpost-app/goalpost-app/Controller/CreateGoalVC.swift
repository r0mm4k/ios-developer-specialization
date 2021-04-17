//
//  CreateGoalVC.swift
//  goalpost-app
//
//  Created by Роман Макаров on 10.04.21.
//

import UIKit

class CreateGoalVC: UIViewController, UITextViewDelegate {

    // MARK: - IB Outlets
    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var shortTermButton: UIButton!
    @IBOutlet weak var longTermButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    // MARK: - Public Properties
    var goalType: GoalType = .shortTerm
    
    // MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goalTextView.delegate = self

        nextButton.bindToKeyboard()
        
        shortTermButton.setSelectedColor()
        longTermButton.setDeselectedColor()
    }
    
    // MARK: - IB Actions
    @IBAction func shortTermButtonWasPressed(_ sender: Any) {
        goalType = .shortTerm
        
        shortTermButton.setSelectedColor()
        longTermButton.setDeselectedColor()
    }
    
    @IBAction func longTermButtonWasPressed(_ sender: Any) {
        goalType = .longTerm
        
        longTermButton.setSelectedColor()
        shortTermButton.setDeselectedColor()
    }
    
    @IBAction func backButtonWasPressed(_ sender: Any) {
        dismissDetail()
    }
    
    @IBAction func nextButtonWasPressed(_ sender: Any) {
        if goalTextView.text != "" && goalTextView.text != "What is your goal?" {
            guard let finishGoalVC = storyboard?.instantiateViewController(withIdentifier: "FinishGoalVC") as? FinishGoalVC else { return }
            
            finishGoalVC.initData(description: goalTextView.text, type: goalType)
            
            presentingViewController?.presentSecondaryDetail(finishGoalVC)
        }
    }
    
    // MARK: - Public Methods
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalTextView.text = ""
        goalTextView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
}
