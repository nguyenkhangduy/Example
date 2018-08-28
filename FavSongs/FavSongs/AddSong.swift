/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2018B
 Assessment: Assignment
 Author: Phi Tran
 ID: s3636649
 Created date: 18/08/2018
 Acknowledgement: if you use any resources, acknowledge here and provide the hyperlinks to the resources.
 Failure to do so may be considered as plagiarism.
 */

import UIKit

class AddSong: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    

    @IBOutlet weak var imageIn: UIImageView!
    @IBOutlet weak var titleIn: UITextField!
    @IBOutlet weak var artistIn: UITextField!
    @IBOutlet weak var yearIn: UITextField!
    @IBOutlet weak var urlIn: UITextField!
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    
    let imagePicker = UIImagePickerController()
    // variable for recieved data
    var editSongIndexPath: IndexPath = []
    var editTitle = ""
    var editArtist = ""
    var editYear = ""
    var editUrl = ""
    var editImage = #imageLiteral(resourceName: "music")
    var barTitle = "Add a song"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imagePicker.delegate = self
        imagePicker.modalPresentationStyle = .overCurrentContext // Use imagePicker in both Orientation
        //Preload data
        titleIn.text = editTitle
        artistIn.text = editArtist
        yearIn.text = editYear
        urlIn.text = editUrl
        imageIn.image = editImage
        navigationBar.topItem?.title = barTitle
    }
    
    // Set imagePick source to Photo Library
    @IBAction func pickImage(_ sender: UIButton) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    // set picked image to imageIn and dismiss imagePicker
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageIn.contentMode = .scaleAspectFit
            imageIn.image = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    // Send data to the Main viewController to save data
    @IBAction func saveSong(_ sender: Any) {
        if (titleIn.text?.isEmpty)! || (artistIn.text?.isEmpty)! || (yearIn.text?.isEmpty)! {
        } else {
            performSegue(withIdentifier: "saveSong", sender: self)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
