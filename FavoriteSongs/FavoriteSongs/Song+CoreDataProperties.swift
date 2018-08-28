//
//  Song+CoreDataProperties.swift
//  FavoriteSongs
//
//  Created by Duy, Nguyen Khang on 8/16/18.
//  Copyright © 2018 Duy, Nguyen Khang. All rights reserved.
//
//

import Foundation
import CoreData


extension Song {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Song> {
        return NSFetchRequest<Song>(entityName: "Song")
    }

    @NSManaged public var age: Int16
    @NSManaged public var name: String?

}
