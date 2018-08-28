//
//  Person+CoreDataProperties.swift
//  Coredatatest
//
//  Created by Khoi, Bui Thanh on 8/14/18.
//  Copyright © 2018 Khoi, Bui Thanh. All rights reserved.
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

}
