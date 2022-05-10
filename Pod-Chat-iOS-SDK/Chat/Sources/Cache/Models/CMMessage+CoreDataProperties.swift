//
//  CMMessage.h
//  FanapPodChatSDK
//
//  Created by Hamed Hosseini on 11/1/21.
//

import Foundation
import CoreData

extension CMMessage {
    @NSManaged public var deletable:        NSNumber?
    @NSManaged public var delivered:        NSNumber?
    @NSManaged public var editable:         NSNumber?
    @NSManaged public var edited:           NSNumber?
    @NSManaged public var id:               NSNumber?
    @NSManaged public var mentioned:        NSNumber?
    @NSManaged public var message:          String?
    @NSManaged public var messageType:      NSNumber?
    @NSManaged public var metadata:         String?
    @NSManaged public var ownerId:          NSNumber?
    @NSManaged public var pinned:           NSNumber?
    @NSManaged public var previousId:       NSNumber?
    @NSManaged public var seen:             NSNumber?
    @NSManaged public var systemMetadata:   String?
    @NSManaged public var threadId:         NSNumber?
    @NSManaged public var time:             NSNumber?
    @NSManaged public var uniqueId:         String?
    @NSManaged public var conversation:     CMConversation?
    @NSManaged public var dummyConversationLastMessageVO: CMConversation?
    @NSManaged public var forwardInfo:      CMForwardInfo?
    @NSManaged public var participant:      CMParticipant?
    @NSManaged public var replyInfo:        CMReplyInfo?
    
}
