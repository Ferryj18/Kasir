//
//  User+CoreDataProperties.swift
//  Kasir
//
//  Created by Ferry jati on 12/09/24.
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var password: String?
    @NSManaged public var email: String?

}
