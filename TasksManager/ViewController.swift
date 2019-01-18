//
//  ViewController.swift
//  TasksManager
//
//  Created by xerasy on 1/17/19.
//  Copyright © 2019 blackDevIos. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

  //  var realm: Realm!

    var objectsArray: Results<Task> {
        get {
            return dbFunction.getArrayItem()
        }
    }
    var dbFunction = DbFunction()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        dbFunction.realm = realm
        
        setup()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MyCell.self, forCellReuseIdentifier: MyCell.reuseIdentifier)
    }
    
  
    func setup() {
        view.backgroundColor = .white
        navigationItem.title = "Tasks"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let addButton = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(addNewItem))
        navigationItem.rightBarButtonItem = addButton
        navigationController?.navigationBar.tintColor = UIColor.black
        
    }
    
    
    @objc func addNewItem() {
        let alertVC = UIAlertController(title: "Add New Task", message: "Set task name", preferredStyle: .alert)
        alertVC.addTextField(configurationHandler: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        let addAction = UIAlertAction(title: "Add", style: .default) { (UIAlertAction) in
            let myTextField = (alertVC.textFields?.first)! as UITextField

            do {
                let item = self.dbFunction.makeNewTask(myTextField.text!)
                let result = try self.dbFunction.write(item)
                if result {
                    self.tableView.insertRows(at: [IndexPath(row: self.objectsArray.count - 1, section: 0)], with: .automatic)
                }
            }catch {
                print(error.localizedDescription)
            }
        }
        alertVC.addAction(cancelAction)
        alertVC.addAction(addAction)
        present(alertVC, animated: true, completion: nil)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MyCell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyCell
        let item = objectsArray[indexPath.row]
        cell.todoLabel.text = item.name
        cell.todoImageView.image = UIImage(named: item.picture)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let item = objectsArray[indexPath.row]
            
            do{
                let result = try self.dbFunction.delete(item)
                if result {
                    tableView.deleteRows(at: [indexPath], with: .automatic)
                }
            }catch {
                print(error.localizedDescription)
            }
        }
    }

}

