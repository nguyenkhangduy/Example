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

import Foundation
import CoreData


extension Song {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Song> {
        return NSFetchRequest<Song>(entityName: "Song")
    }

    @NSManaged public var artist: String?
    @NSManaged public var image: NSData?
    @NSManaged public var title: String?
    @NSManaged public var year: Int16
    @NSManaged public var url: String?

}
