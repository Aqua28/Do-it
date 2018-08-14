//
//  TasksViewController.swift
//  Do it
//
//  Created by Lydia Liu on 8/12/18.
//  Copyright © 2018 Lydia Liu. All rights reserved.
//

import UIKit
import CoreData

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var listoftasks: UITableView!
    var selectedRow : Int = 0
    
    var tasks : [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listoftasks.delegate = self
        listoftasks.dataSource = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        getTasks()
        listoftasks.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = tasks[indexPath.row]
        let cell = UITableViewCell()
        
        if task.important == true {
            cell.textLabel?.text = task.name! + "!!!"
        }
        else{
              cell.textLabel?.text = task.name
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    

    
    
    @IBAction func addTapped(_ sender: Any) {
        performSegue(withIdentifier: "addNewSegue", sender: nil)
    }
    func getTasks() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
           tasks = try context.fetch(Task.fetchRequest()) as [Task]
        } catch {
            print("fetch request error")
        }
        
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
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
    



}

