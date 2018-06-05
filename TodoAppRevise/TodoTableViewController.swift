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

    var itemArray = [Todo_item]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
//   let item = Parrent_todo(context: (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.reloadData()
        // Do any additional setup after loading the view, typically from a nib.
        loadItems()
    }
    
    //MARK - TableView DataSource Methods:
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row].name
        
        return cell
    }
    
    //MARK - TableView delegate methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Add New Item
    
    @IBAction func addNewTodo(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Todo Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Todo", style: .default) { (action) in
            //once Add Todo button is clicked
            
            let newTodo = Todo_item(context: self.context)
            newTodo.name = textField.text!
            print(textField.text!)
            newTodo.done = false
            
            self.itemArray.append(newTodo)
            print("Saving Data")
            self.saveItems()
            
        }
        alert.addAction(action)
        alert.addTextField { (alertTextInputFeild) in
            alertTextInputFeild.placeholder = "Create new Todo"
            textField = alertTextInputFeild
        }
        
        present(alert, animated: true, completion: nil)
    }
    
    //MARK - Model manuplation methodd
 
    func saveItems(){
        do{
            try context.save()
            print("TODO ADDED")
        }
        catch{
            print("Error saving data ::: \(error)")
        }
        tableView.reloadData()
    }
    
    func loadItems(){
        let request : NSFetchRequest<Todo_item> = Todo_item.fetchRequest()
        
        do{
            itemArray = try context.fetch(request)
            print("CCCCCC \(itemArray.count)")
        }catch{
            print("Can not read Data: \(error)")
        }
        
    }

}

