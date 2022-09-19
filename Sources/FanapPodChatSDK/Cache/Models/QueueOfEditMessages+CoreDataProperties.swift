//
//  QueueOfEditMessages.h
//  FanapPodChatSDK
//
//  Created by Hamed Hosseini on 11/1/21.
//

import Foundation
import CoreData


extension QueueOfEditMessages {


    @NSManaged public var textMessage:  String?
    @NSManaged public var messageType:  NSNumber?
    @NSManaged public var metadata:     String?
    @NSManaged public var repliedTo:    NSNumber?
    @NSManaged public var messageId:    NSNumber?
    @NSManaged public var threadId:     NSNumber?
    @NSManaged public var typeCode:     String?
    @NSManaged public var uniqueId:     String?

}