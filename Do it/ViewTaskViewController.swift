//
//  ViewTaskViewController.swift
//  Do it
//
//  Created by Lydia Liu on 8/13/18.
//  Copyright © 2018 Lydia Liu. All rights reserved.
//

import UIKit

class ViewTaskViewController: UIViewController {

    var task = Task()
    var previousVC = TasksViewController()
    
    @IBOutlet weak var taskName: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskName.text = task.name

    }
    
    @IBAction func removeButtonTapped(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(task)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController?.popViewController(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
