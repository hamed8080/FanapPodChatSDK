//
// MessageDeliveryParticipantsRequestHandler.swift
// Copyright (c) 2022 FanapPodChatSDK
//
// Created by Hamed Hosseini on 9/27/22.

import Foundation
class MessageDeliveryParticipantsRequestHandler {
    class func handle(_ req: MessageDeliveredUsersRequest,
                      _ chat: Chat,
                      _ completion: @escaping PaginationCompletionType<[Participant]>,
                      _ uniqueIdResult: UniqueIdResultType = nil)
    {
        chat.prepareToSendAsync(req: req,
                                clientSpecificUniqueId: req.uniqueId,
                                messageType: .getMessageDeleveryParticipants,
                                uniqueIdResult: uniqueIdResult) { response in
            let pagination = PaginationWithContentCount(count: req.count, offset: req.offset, totalCount: response.contentCount)
            completion(response.result as? [Participant], response.uniqueId, pagination, response.error)
        }
    }
}
