//
// DeleteThreadRequestHandler.swift
// Copyright (c) 2022 FanapPodChatSDK
//
// Created by Hamed Hosseini on 9/27/22.

import Foundation
class DeleteThreadRequestHandler {
    class func handle(_ req: GeneralSubjectIdRequest,
                      _ chat: Chat,
                      _ completion: @escaping CompletionType<Int>,
                      _ uniqueIdResult: UniqueIdResultType? = nil)
    {
        req.chatMessageType = .deleteThread
        chat.prepareToSendAsync(req: req, uniqueIdResult: uniqueIdResult) { response in
            completion(response.result as? Int, response.uniqueId, response.error)
        }
    }
}
