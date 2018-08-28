//
//  SongViewController.swift
//  FavoriteSongList
//
//  Created by Duy, Nguyen Khang on 8/23/18.
//  Copyright © 2018 Duy, Nguyen Khang. All rights reserved.
//

import UIKit

class SongViewController: UIViewController {

    @IBOutlet weak var inputName: UITextField!
    @IBOutlet weak var inputUrl: UITextField!
    @IBOutlet weak var inputAge: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func addSong(_ sender: Any) {
        if let text = inputName.text, let text2 = inputUrl.text,let text3 = inputAge.text{
            let person = Person(context: PersistenceService.context)
            person.name = text
            person.nickname = text2
            person.age = Int16(text3)!
            PersistenceService.saveContext()
            people.append(person)
        }
        performSegue(withIdentifier: "toList", sender: self)
    }
    
    @IBAction func goBack(_ sender: Any) {
        performSegue(withIdentifier: "toList", sender: self)
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
