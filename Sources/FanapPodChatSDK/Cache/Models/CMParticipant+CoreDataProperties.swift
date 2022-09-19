//
//  CMParticipant.h
//  FanapPodChatSDK
//
//  Created by Hamed Hosseini on 11/1/21.
//

import Foundation
import CoreData


extension CMParticipant {
    @NSManaged public var admin:            NSNumber?
    @NSManaged public var auditor:          NSNumber?
    @NSManaged public var blocked:          NSNumber?
    @NSManaged public var cellphoneNumber:  String?
    @NSManaged public var contactFirstName: String?
    @NSManaged public var contactId:        NSNumber?
    @NSManaged public var contactName:      String?
    @NSManaged public var contactLastName:  String?
    @NSManaged public var coreUserId:       NSNumber?
    @NSManaged public var email:            String?
    @NSManaged public var firstName:        String?
    @NSManaged public var id:               NSNumber?
    @NSManaged public var image:            String?
    @NSManaged public var keyId:            String?
    @NSManaged public var lastName:         String?
    @NSManaged public var myFriend:         NSNumber?
    @NSManaged public var name:             String?
    @NSManaged public var notSeenDuration:  NSNumber?
    @NSManaged public var online:           NSNumber?
    @NSManaged public var receiveEnable:    NSNumber?
    @NSManaged public var roles:            [String]?
    @NSManaged public var sendEnable:       NSNumber?
    @NSManaged public var threadId:         NSNumber?
    @NSManaged public var time:             NSNumber?
    @NSManaged public var username:         String?
    @NSManaged public var bio:              String?
    @NSManaged public var metadata:         String?
    @NSManaged public var dummyConversationInviter:         NSSet?
    @NSManaged public var dummyConversationParticipants:    NSSet?
    @NSManaged public var dummyForwardInfo:                 CMForwardInfo?
    @NSManaged public var dummyMessage:                     NSSet?
    @NSManaged public var dummyReplyInfo:                   CMReplyInfo?

}


// MARK: Generated accessors for dummyConversationInviter
extension CMParticipant {

    @objc(addDummyConversationInviterObject:)
    @NSManaged public func addToDummyConversationInviter(_ value: CMConversation)

    @objc(removeDummyConversationInviterObject:)
    @NSManaged public func removeFromDummyConversationInviter(_ value: CMConversation)

    @objc(addDummyConversationInviter:)
    @NSManaged public func addToDummyConversationInviter(_ values: NSSet)

    @objc(removeDummyConversationInviter:)
    @NSManaged public func removeFromDummyConversationInviter(_ values: NSSet)

}

// MARK: Generated accessors for dummyConversationParticipants
extension CMParticipant {

    @objc(addDummyConversationParticipantsObject:)
    @NSManaged public func addToDummyConversationParticipants(_ value: CMConversation)

    @objc(removeDummyConversationParticipantsObject:)
    @NSManaged public func removeFromDummyConversationParticipants(_ value: CMConversation)

    @objc(addDummyConversationParticipants:)
    @NSManaged public func addToDummyConversationParticipants(_ values: NSSet)

    @objc(removeDummyConversationParticipants:)
    @NSManaged public func removeFromDummyConversationParticipants(_ values: NSSet)

}

// MARK: Generated accessors for dummyMessage
extension CMParticipant {

    @objc(addDummyMessageObject:)
    @NSManaged public func addToDummyMessage(_ value: CMMessage)

    @objc(removeDummyMessageObject:)
    @NSManaged public func removeFromDummyMessage(_ value: CMMessage)

    @objc(addDummyMessage:)
    @NSManaged public func addToDummyMessage(_ values: NSSet)

    @objc(removeDummyMessage:)
    @NSManaged public func removeFromDummyMessage(_ values: NSSet)

}
