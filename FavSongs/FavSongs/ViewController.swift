/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2018B
 Assessment: Assignment
 Author: Phi Tran
 ID: s3636649
 Created date: 14/08/2018
 Acknowledgement: if you use any resources, acknowledge here and provide the hyperlinks to the resources.
 Failure to do so may be considered as plagiarism.
 */

import UIKit
import CoreData

class ViewController: UIViewController {

    var songList = [Song]()
    
    // Prepare value of needed to edit song to pass to another view
    var editSongIndexPath: IndexPath = []
    var editTitle = ""
    var editArtist = ""
    var editYear = ""
    var editUrl = ""
    var editImage = #imageLiteral(resourceName: "music")
    var barTitle = "Add a song"
    
    @IBOutlet weak var songTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Fetch data from core data
        let fetchRequest: NSFetchRequest<Song> = Song.fetchRequest()

        do {
            let song = try PersistenceService.context.fetch(fetchRequest)
            self.songList = song
            self.songTable.reloadData()
        } catch {}
    }
    

    // Unwind is used to retrieve data from AddSong view
    @IBAction func unwindSaveSong(_ sender: UIStoryboardSegue) {
        guard let saveSong = sender.source as? AddSong else {return}
        let title = saveSong.titleIn.text
        let artist = saveSong.artistIn.text
        let year = saveSong.yearIn.text
        var url = saveSong.urlIn.text
        if url != "" { // Check if there is an url
            if (!url!.hasPrefix("http://")) && (!url!.hasPrefix("https://")) {
                url = "http://" + url! // Add "http://" if the user not input that prefix
            }
        }
        let image: NSData = (UIImagePNGRepresentation(saveSong.imageIn.image!) as NSData?)!
        let indexPath = saveSong.editSongIndexPath
        if indexPath.isEmpty { // Save new song
            let song = Song(context: PersistenceService.context)
            song.title = title
            song.artist = artist
            song.year = Int16(year!)!
            song.url = url
            song.image = image
            songList.append(song)
        } else { // Edit a song
            let editSong = songList[indexPath.row]
            editSong.title = title
            editSong.artist = artist
            editSong.year = Int16(year!)!
            editSong.url = url
            editSong.image = image
            songList[indexPath.row] = editSong
        }
        PersistenceService.saveContext()
        songTable.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Prepare data to send to edit screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editView = segue.destination as! AddSong
        if segue.identifier == "editSong" {
            editView.editTitle = editTitle
            editView.editArtist = editArtist
            editView.editYear = editYear
            editView.editUrl = editUrl
            editView.editImage = editImage
            editView.editSongIndexPath = editSongIndexPath
            editView.barTitle = barTitle
        }
    }
}


// Handle the tableView
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songList.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Construct cell for each row in tableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyCustomCell
        cell.cellTitle?.text = songList[indexPath.row].title
        cell.cellArtist?.text = songList[indexPath.row].artist
        cell.cellYear?.text = String(songList[indexPath.row].year)
        cell.cellImage?.image = UIImage(data: songList[indexPath.row].image! as Data)
        return cell
    }
    
    // Open webPage if click in the row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if songList[indexPath.row].url != "" {
            let url = URL(string: songList[indexPath.row].url!)
            UIApplication.shared.open(url!, options: ["": ""], completionHandler: nil)
        }
    }

    
    // Tableview Swipe actions
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let editAction = UITableViewRowAction(style: .default, title: "Edit", handler: { (action, indexPath) in
            // Edit Cell
            self.editSongIndexPath = indexPath
            self.editTitle = self.songList[indexPath.row].title!
            self.editArtist = self.songList[indexPath.row].artist!
            self.editYear = String(self.songList[indexPath.row].year)
            self.editUrl = self.songList[indexPath.row].url!
            self.editImage = UIImage(data: self.songList[indexPath.row].image! as Data)!
            self.barTitle = "Edit a song"
            self.performSegue(withIdentifier: "editSong", sender: self)
            })
        editAction.backgroundColor = UIColor.gray
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { (action, indexPath) in
            // Delete Cell
            let deleteSong = self.songList[indexPath.row]
            PersistenceService.context.delete(deleteSong)
            PersistenceService.saveContext()
            self.songList.remove(at: indexPath.row)
            self.songTable.reloadData()
        }
        return [deleteAction, editAction]
    }
    
}
