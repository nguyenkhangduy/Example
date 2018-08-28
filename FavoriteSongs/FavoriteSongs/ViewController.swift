//
//  ViewController.swift
//  FavoriteSongs
//
//  Created by Duy, Nguyen Khang on 8/16/18.
//  Copyright © 2018 Duy, Nguyen Khang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var list = [Song]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func add(_ sender: Any) {
        let alert = UIAlertController(title: "Add song",message: nil, preferredStyle: .alert)
        alert.addTextField{
            (textField) in textField.placeholder = "Name"
        }
        alert.addTextField{
            (textField) in textField.placeholder = "Age"
            textField.keyboardType = .numberPad
        }
        let action = UIAlertAction(title: "Post",style: .default){ (_) in
            let name = alert.textFields!.first!.text!
            let age = alert.textFields!.last!.text!
            let song = Song(context: PersistenceService.context)
            song.name = name
            song.age = Int16(age)!
            self.list.append(song)
            self.tableView.reloadData()
            PersistenceService.saveContext()
        }
        alert.addAction(action)
        present(alert, animated:true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = ""
        cell.detailTextLabel?.text = ""
        return cell
    }
}
