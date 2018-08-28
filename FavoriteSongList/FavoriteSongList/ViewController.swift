//
//  ViewController.swift
//  FavoriteSongList
//
//  Created by Duy, Nguyen Khang on 8/20/18.
//  Copyright © 2018 Duy, Nguyen Khang. All rights reserved.
//

import UIKit
import CoreData
let urlArray = ["http://google.com", "https://apple.com"]
var myIndex = 0
var people = [Person]()
class ViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    
    var people = [Person]()
    @IBOutlet weak var label: UINavigationBar!
    
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
    
   
    @IBAction func onPlustapped(_ sender: Any) {
    performSegue(withIdentifier: "addSong", sender: self)
    
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = people[indexPath.row].name!
        return cell 
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        let urlString = people[indexPath.row].nickname!
        if let url = URL(string: urlString){
            UIApplication.shared.open(url,options: [:],completionHandler: nil)
        }
    }
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == UITableViewCellEditingStyle.delete{
//            self.people.remove(at: indexPath.row)
//            tableView.reloadData()
//        }
//    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let editButton = UITableViewRowAction(style: .normal,title:"Edit"){(rowAction,indexpath) in
            print("Edit Clicked")
        }
        let deleteButton = UITableViewRowAction(style: .normal,title: "Delete"){(rowAction,indexpath) in
            self.people.remove(at: indexPath.row)
            tableView.reloadData()
        }
        editButton.backgroundColor = UIColor.blue
        deleteButton.backgroundColor = UIColor.red
        return[deleteButton,editButton]

    }
    
    
}
