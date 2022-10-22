//
// CurrentUserRolesRequestHandler.swift
// Copyright (c) 2022 FanapPodChatSDK
//
// Created by Hamed Hosseini on 9/27/22.

import Foundation
class CurrentUserRolesRequestHandler {
    class func handle(_ req: CurrentUserRolesRequest,
                      _ chat: Chat,
                      _ completion: @escaping CompletionType<[Roles]>,
                      _ cacheResponse: CacheResponseType<[Roles]>? = nil,
                      _ uniqueIdResult: UniqueIdResultType = nil)
    {
        chat.prepareToSendAsync(req: nil,
                                clientSpecificUniqueId: req.uniqueId,
                                subjectId: req.threadId,
                                messageType: .getCurrentUserRoles,
                                uniqueIdResult: uniqueIdResult) { response in
            completion(response.result as? [Roles], response.uniqueId, response.error)
        }

        CacheFactory.get(useCache: cacheResponse != nil, cacheType: .cureentUserRoles(req.threadId)) { response in
            cacheResponse?(response.cacheResponse as? [Roles], req.uniqueId, nil)
        }
    }
}
