//
//  CMBlockedContact+CoreDataProperties.swift
//  Chat
//
//  Created by Mahyar Zhiani on 10/5/1397 AP.
//  Copyright © 1397 Mahyar Zhiani. All rights reserved.
//
//

import Foundation
import CoreData


extension CMBlockedContact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CMBlockedContact> {
        return NSFetchRequest<CMBlockedContact>(entityName: "CMBlockedContact")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var id:       NSNumber?
    @NSManaged public var lastName: String?
    @NSManaged public var nickName: String?

}
