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

import Foundation
import CoreData


extension Song {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Song> {
        return NSFetchRequest<Song>(entityName: "Song")
    }

    @NSManaged public var artist: String?
    @NSManaged public var title: String?
    @NSManaged public var year: Int16
    @NSManaged public var url: String?
    @NSManaged public var image: NSData?

}
