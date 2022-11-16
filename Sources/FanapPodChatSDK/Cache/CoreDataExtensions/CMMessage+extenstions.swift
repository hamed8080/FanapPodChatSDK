//
// CMMessage+extenstions.swift
// Copyright (c) 2022 FanapPodChatSDK
//
// Created by Hamed Hosseini on 9/27/22.

import CoreData
import Foundation

public extension CMMessage {
    static let crud = CoreDataCrud<CMMessage>(entityName: "CMMessage")

    func getCodable(setCodableConversation: Bool = true) -> Message {
        Message(threadId: threadId as? Int,
                deletable: deletable as? Bool,
                delivered: delivered as? Bool,
                editable: editable as? Bool,
                edited: edited as? Bool,
                id: id as? Int,
                mentioned: mentioned as? Bool,
                message: message,
                messageType: MessageType(rawValue: messageType as? Int ?? MessageType.unknown.rawValue),
                metadata: metadata,
                ownerId: ownerId as? Int,
                pinned: pinned as? Bool,
                previousId: previousId as? Int,
                seen: seen as? Bool,
                systemMetadata: systemMetadata,
                time: time as? UInt,
                timeNanos: 0,
                uniqueId: uniqueId,
                conversation: setCodableConversation == true ? conversation?.getCodable() : nil,
                forwardInfo: forwardInfo?.getCodable(),
                participant: participant?.getCodable(),
                replyInfo: replyInfo?.getCodable())
    }

    class func convertMesageToCM(message: Message, entity: CMMessage? = nil, conversation: CMConversation?) -> CMMessage {
        let model = entity ?? CMMessage()
        model.deletable = message.deletable as NSNumber?
        model.delivered = message.delivered as NSNumber?
        model.editable = message.editable as NSNumber?
        model.edited = message.edited as NSNumber?
        model.id = message.id as NSNumber?
        model.mentioned = message.mentioned as NSNumber?
        model.message = message.message
        model.messageType = message.messageType?.rawValue as NSNumber?
        model.metadata = message.metadata
        model.ownerId = message.ownerId as NSNumber?
        model.pinned = message.pinned as NSNumber?
        model.previousId = message.previousId as NSNumber?
        model.seen = message.seen as NSNumber?
        model.systemMetadata = message.systemMetadata
        model.threadId = message.threadId as NSNumber?
        model.time = message.time as NSNumber?
        model.uniqueId = message.uniqueId
        if let conversation = conversation {
            model.conversation = conversation // prevent write nil when pinMessage or other method need to update or insert beacause it nil
        }

        if let participant = message.participant, let threadId = conversation?.id as? Int {
            CMParticipant.insertOrUpdate(participant: participant, threadId: threadId) { resultEntity in
                model.participant = resultEntity
            }
        }
        if let replyInfo = message.replyInfo, let threadId = conversation?.id as? Int {
            CMReplyInfo.insertOrUpdate(replyInfo: replyInfo, messageId: message.id, threadId: threadId) { resultEntity in
                model.replyInfo = resultEntity
            }
        }

        if let forwardInfo = message.forwardInfo, let threadId = conversation?.id as? Int {
            CMForwardInfo.insertOrUpdate(forwardInfo: forwardInfo, messageId: message.id, threadId: threadId) { resultEntity in
                model.forwardInfo = resultEntity
            }
        }

        return model
    }

    class func insertOrUpdate(message: Message, resultEntity: ((CMMessage) -> Void)? = nil) {
        if let conversation = message.conversation,
           let threadId = conversation.id,
           let findedThread = CMConversation.crud.find(keyWithFromat: "id == %i", value: threadId)
        {
            message.threadId = conversation.id
            insertOrUpdate(message: message, conversation: findedThread) { messageEntity in
                findedThread.lastMessageVO = messageEntity
                findedThread.lastMessage = messageEntity.message
                findedThread.unreadCount = messageEntity.conversation?.unreadCount ?? 0
                resultEntity?(messageEntity)
            }
        }
    }

    class func insertOrUpdate(message: Message, conversation: CMConversation?, resultEntity: ((CMMessage) -> Void)? = nil) {
        if let id = message.id, let findedEntity = CMMessage.crud.find(keyWithFromat: "id == %i", value: id) {
            let cmMessage = convertMesageToCM(message: message, entity: findedEntity, conversation: conversation)
            resultEntity?(cmMessage)
        } else {
            CMMessage.crud.insert { cmMessage in
                let cmMessage = convertMesageToCM(message: message, entity: cmMessage, conversation: conversation)
                resultEntity?(cmMessage)
            }
        }
    }

    class func fetchRequestWithGetHistoryRequest(req: GetHistoryRequest) -> NSFetchRequest<NSFetchRequestResult> {
        let fetchRequest = crud.fetchRequest()
        fetchRequest.fetchOffset = req.offset
        fetchRequest.fetchLimit = req.count
        let sortByTime = NSSortDescriptor(key: "time", ascending: (req.order == Ordering.asc.rawValue) ? true : false)
        fetchRequest.sortDescriptors = [sortByTime]
        if let messageId = req.messageId {
            fetchRequest.predicate = NSPredicate(format: "id == %i", messageId)
        } else if let uniqueIds = req.uniqueIds {
            fetchRequest.predicate = NSPredicate(format: "uniqueId IN %@", uniqueIds)
        } else {
            var predicateArray = [NSPredicate]()
            predicateArray.append(NSPredicate(format: "threadId == %i", req.threadId))
            if let formTime = req.fromTime as? NSNumber {
                predicateArray.append(NSPredicate(format: "time >= %@", formTime))
            }
            if let toTime = req.toTime as? NSNumber {
                predicateArray.append(NSPredicate(format: "time <= %@", toTime))
            }
            if let query = req.query, query != "" {
                predicateArray.append(NSPredicate(format: "message CONTAINS[cd] %@", query))
            }
            if let messageType = req.messageType {
                predicateArray.append(NSPredicate(format: "messageType == %i", messageType))
            }
            let compoundPredicate = NSCompoundPredicate(type: .and, subpredicates: predicateArray)
            fetchRequest.predicate = compoundPredicate
        }
        return fetchRequest
    }
}
