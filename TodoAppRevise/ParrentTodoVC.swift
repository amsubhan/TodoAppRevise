//
//  CategoryTableViewController.swift
//  TodoAppRevise
//
//  Created by Admin on 2018-06-05.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import CoreData

class ParrentTodoVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadItems()
    }
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var parrentTodos = [Parrent_todo]()
    
    //MARK - TableView Datasource methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parrentTodos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "parrentTodoCell", for: indexPath)
        cell.textLabel?.text = parrentTodos[indexPath.row].name
        return cell
    }
    
    //MARK - TableView Delegate methods
    
   

    @IBAction func addParrentTodo(_ sender: UIBarButtonItem) {
        var textfield = UITextField()
        let alert = UIAlertController(title: "Add Todo Category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
            let newItem = Parrent_todo(context: self.context)
            newItem.name = textfield.text
            self.parrentTodos.append(newItem)
            self.saveItems()
        }
        
        alert.addAction(action)
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Add Parrent Todo"
            textfield = alertTextField
        }
        present(alert, animated: true, completion: nil)
    }
    
     //MARK - Data manipulation methods
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
    
    func loadItems(with request : NSFetchRequest<Parrent_todo> = Parrent_todo.fetchRequest()){
        
        do{
            parrentTodos = try context.fetch(request)
            print("CCCCCC \(parrentTodos.count)")
        }catch{
            print("Can not read Data: \(error)")
        }
        tableView.reloadData()
    }

}
