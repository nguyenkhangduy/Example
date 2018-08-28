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

class TableViewCell: UITableViewCell {

    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myText: UILabel!
    @IBOutlet weak var myText2: UILabel!
    @IBOutlet weak var myText3: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
