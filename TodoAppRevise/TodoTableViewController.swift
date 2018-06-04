//
//  ViewController.swift
//  TodoAppRevise
//
//  Created by Admin on 2018-06-04.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import CoreData

class TodoTableViewController: UITableViewController {

    let itemArray = ["Revise CoreData"]
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
   let item = Parrent_todo(context: (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    //MARK - TableView DataSource Methods:
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    

//
//    func saveItems(){
//        do{
//            try context.save()
//        }
//        catch{
//            print("Error saving data \(error)")
//        }
//    }

}

