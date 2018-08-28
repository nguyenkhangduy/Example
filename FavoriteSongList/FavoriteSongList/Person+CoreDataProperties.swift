//
//  Person+CoreDataProperties.swift
//  FavoriteSongList
//
//  Created by Duy, Nguyen Khang on 8/20/18.
//  Copyright © 2018 Duy, Nguyen Khang. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var nickname: String?

}
