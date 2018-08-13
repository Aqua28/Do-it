//
//  AddTaskViewController.swift
//  Do it
//
//  Created by Lydia Liu on 8/13/18.
//  Copyright © 2018 Lydia Liu. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

   
    var previousVC = TasksViewController()

    
    
    @IBOutlet weak var taskNameTextField: UITextField!
    
    @IBOutlet weak var importantSwitch: UISwitch!
    
    @IBAction func addTask(_ sender: Any) {
        //create new task
        let task = Task()
        task.important = importantSwitch.isOn
        task.name = taskNameTextField.text!
        
        //add task to array in previous viewcontroller
        previousVC.tasks.append(task)
        previousVC.listoftasks.reloadData()
        
        //line of code that pops back to previous VC
        
    navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   
}
