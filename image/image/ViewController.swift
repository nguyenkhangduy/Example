/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2018B
 Assessment: Assignment
 Author: Nguyen Khang Duy
 ID: s3636076
 Created date: 23/08/18
 Acknowledgement: https://github.com/Kilo-Loco/CoreData

 */

import UIKit
import CoreData

var songs = [Song]()
var myIndex = 0 //index of the choosing row
class ViewController: UIViewController {
    
    @IBOutlet weak var appName: UINavigationBar!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Fetch core data when open the app
        let fetchRequest: NSFetchRequest<Song> = Song.fetchRequest()
        do{
            let song = try PersistenceService.context.fetch(fetchRequest)
            songs = song
            self.tableView.reloadData()
        } catch {}
    }
    
    @IBAction func add(_ sender: Any) {
        performSegue(withIdentifier: "addToList", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    //access coredata to display information to the list
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.myText.text = songs[indexPath.row].title!
        cell.myText2.text = songs[indexPath.row].artist!
        cell.myText3.text = String(songs[indexPath.row].year)
        if let data = songs[indexPath.row].image as Data? {
            cell.myImage.image = UIImage(data:data)
        }
        return cell
    }
    
    // Open url
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let urlString = songs[indexPath.row].url!
        if let url = URL(string: urlString){
            UIApplication.shared.open(url,options: [:],completionHandler: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // Edit and Delete rows
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let editButton = UITableViewRowAction(style: .normal,title:"Edit"){(rowAction, indexPath) in
            myIndex = indexPath.row
            self.performSegue(withIdentifier: "editList", sender: self)
            
        }
        let deleteButton = UITableViewRowAction(style: .normal,title: "Delete"){(rowAction,indexPath) in
            let song = songs.remove(at: indexPath.row)
            PersistenceService.context.delete(song)
            PersistenceService.saveContext()
            tableView.reloadData()
        }
        editButton.backgroundColor = UIColor.blue
        deleteButton.backgroundColor = UIColor.red
        return[deleteButton,editButton]
        
    }
    
}

