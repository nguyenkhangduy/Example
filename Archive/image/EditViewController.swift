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

class EditViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var inputTitle: UITextField!
    @IBOutlet weak var inputArtist: UITextField!
    @IBOutlet weak var inputYear: UITextField!
    @IBOutlet weak var inputUrl: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputYear.delegate = self
        inputYear.keyboardType = .numberPad //change keyboard for year to numberpad
        inputTitle.placeholder = "Type in new TITLE"
        inputArtist.placeholder = "Type in new ARTIST"
        inputYear.placeholder = "Type in new YEAR"
        inputUrl.placeholder = "Type in new URL"
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
    
    //image chooser
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            imageView.image = image
        }
        else{
            print("Error! Please choose again!")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func setBack(_ sender: Any) {
            performSegue(withIdentifier: "goBackEdit", sender: self)
    }
    
    @IBAction func editSong(_ sender: Any) {
    if let text = inputTitle.text, let text2 = inputArtist.text,let text3 = inputYear.text, let text4 = inputUrl.text, let image = imageView.image {
            // change old data to the new data
            songs[myIndex].title = text
            songs[myIndex].artist = text2
            songs[myIndex].year = Int16(text3)!
            songs[myIndex].url = text4
            songs[myIndex].image = UIImagePNGRepresentation(image) as NSData?
            PersistenceService.saveContext()
        }
        performSegue(withIdentifier: "goBackEdit", sender: self)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

