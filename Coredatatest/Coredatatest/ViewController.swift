//
//  ViewController.swift
//  Coredatatest
//
//  Created by Khoi, Bui Thanh on 8/14/18.
//  Copyright © 2018 Khoi, Bui Thanh. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    var people = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let fetchRequest: NSFetchRequest<Person> = Person.fetchRequest()
        
        do{
            let people = try PersistenceService.context.fetch(fetchRequest)
            self.people = people
            self.tableview.reloadData()
        } catch {}
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onPlustapped(_ sender: Any) {
        let alert = UIAlertController(title: "Add person", message: nil, preferredStyle: .alert)
        alert.addTextField{(textField) in
            textField.placeholder = "Name"
        }
        alert.addTextField{(textField) in
            textField.placeholder = "Age"
            textField.keyboardType = .numberPad
        }
        let action = UIAlertAction(title: "Post", style: .default){(_) in
            let name = alert.textFields!.first!.text!
            let age = alert.textFields!.last!.text!
            let person = Person(context: PersistenceService.context)
            person.name = name
            person.age = Int16(age)!
            PersistenceService.saveContext()
            self.people.append(person)
            self.tableview.reloadData()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = people[indexPath.row].name
        cell.detailTextLabel?.text = String(people[indexPath.row].age)
        return cell
    }
}
