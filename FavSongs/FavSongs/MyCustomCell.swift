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

class MyCustomCell: UITableViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellArtist: UILabel!
    @IBOutlet weak var cellYear: UILabel!
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
