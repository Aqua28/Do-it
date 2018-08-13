//
//  TasksViewController.swift
//  Do it
//
//  Created by Lydia Liu on 8/12/18.
//  Copyright © 2018 Lydia Liu. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var listoftasks: UITableView!
    var selectedRow : Int = 0
    
    var tasks : [Task] = []
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = tasks[indexPath.row]
        let cell = UITableViewCell()
        
        if task.important == true {
              cell.textLabel?.text = task.name + "!!!"
        }
        else{
              cell.textLabel?.text = task.name
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func makeTasks() -> [Task]{
        let task1 = Task()
        task1.name = "Buy cheese"
        task1.important = false
        
        let task2 = Task()
        task2.name = "Dance in the rain"
        task2.important = true
        
        let task3 = Task()
        task3.name = "Stop thinking"
        task3.important = true
        
        return [task1, task2, task3]
    }
    
    

    
    
    @IBAction func addTapped(_ sender: Any) {
        performSegue(withIdentifier: "addNewSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addNewSegue"{
        let nextVC = segue.destination as! AddTaskViewController
        nextVC.previousVC = self
        }
        if segue.identifier == "selectTask"{
            let nextVC = segue.destination as! ViewTaskViewController
            nextVC.task = sender as! Task
            nextVC.previousVC = self
        
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        let selectedRow = indexPath.row
        performSegue(withIdentifier: "selectTask", sender: task)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tasks = makeTasks()
        listoftasks.delegate = self
        listoftasks.dataSource = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }


}

