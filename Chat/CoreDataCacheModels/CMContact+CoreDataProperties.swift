//
//  CMContact+CoreDataProperties.swift
//  Chat
//
//  Created by Mahyar Zhiani on 10/5/1397 AP.
//  Copyright © 1397 Mahyar Zhiani. All rights reserved.
//
//

import Foundation
import CoreData


extension CMContact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CMContact> {
        return NSFetchRequest<CMContact>(entityName: "CMContact")
    }

    @NSManaged public var cellphoneNumber:  String?
    @NSManaged public var email:            String?
    @NSManaged public var firstName:        String?
    @NSManaged public var hasUser:          NSNumber?
    @NSManaged public var id:               NSNumber?
    @NSManaged public var image:            String?
    @NSManaged public var lastName:         String?
    @NSManaged public var notSeenDuration:  NSNumber?
    @NSManaged public var uniqueId:         String?
    @NSManaged public var userId:           NSNumber?
    @NSManaged public var linkedUser:       CMLinkedUser?

}
