//
// TerminateCallRequestHandler.swift
// Copyright (c) 2022 FanapPodChatSDK
//
// Created by Hamed Hosseini on 9/27/22.

import Foundation
class TerminateCallRequestHandler {
    class func handle(_ req: GeneralSubjectIdRequest,
                      _ chat: Chat,
                      _ completion: CompletionType<[CallParticipant]>? = nil,
                      _ uniqueIdResult: UniqueIdResultType? = nil)
    {
        req.chatMessageType = .terminateCall
        chat.prepareToSendAsync(req: req, uniqueIdResult: uniqueIdResult) { response in
            completion?(response.result as? [CallParticipant], response.uniqueId, response.error)
        }
    }
}
