//
// GetBlockedContactsRequestHandler.swift
// Copyright (c) 2022 FanapPodChatSDK
//
// Created by Hamed Hosseini on 9/27/22.

import Contacts
import Foundation
class GetBlockedContactsRequestHandler {
    class func handle(_ req: BlockedListRequest,
                      _ chat: Chat,
                      _ completion: @escaping PaginationCompletionType<[BlockedContact]>,
                      _ uniqueIdResult: UniqueIdResultType? = nil)
    {
        chat.prepareToSendAsync(req: req, uniqueIdResult: uniqueIdResult) { response in
            let pagination = PaginationWithContentCount(count: req.count, offset: req.offset, totalCount: response.contentCount)
            completion(response.result as? [BlockedContact], response.uniqueId, pagination, response.error)
        }
    }
}
