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

class SongViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate,UITextFieldDelegate {
    
    @IBOutlet weak var inputUrl: UITextField!
    @IBOutlet weak var inputYear: UITextField!
    @IBOutlet weak var inputArtist: UITextField!
    @IBOutlet weak var inputTitle: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        inputYear.delegate = self
        inputYear.keyboardType = .numberPad
    }
    
    //add image button action
    @IBAction func addImage(_ sender: Any) {
    let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        image.allowsEditing = false
        self.present(image, animated: true){
        }
    }
    
    // image chooser
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            imageView.image = image
        }
        else{
            print("Error! Please choose again!")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goBack(_ sender: Any) {
        performSegue(withIdentifier: "toList", sender: self)
    }
    
    //set data into coredata
    @IBAction func addSong(_ sender: Any) {
    if let text = inputTitle.text, let text2 = inputArtist.text,let text3 = inputYear.text, let text4 = inputUrl.text, let image = imageView.image {
            let song = Song(context: PersistenceService.context)
            song.title = text
            song.artist = text2
            song.year = Int16(text3)!
            song.url = text4
            song.image = UIImagePNGRepresentation(image) as NSData?
            PersistenceService.saveContext()
            songs.append(song)
        }
        performSegue(withIdentifier: "toList", sender: self)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
