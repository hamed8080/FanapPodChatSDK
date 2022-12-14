//
// RemoveParticipantsRequestHandler.swift
// Copyright (c) 2022 FanapPodChatSDK
//
// Created by Hamed Hosseini on 9/27/22.

import Foundation
class RemoveParticipantsRequestHandler {
    class func handle(_ req: RemoveParticipantsRequest,
                      _ chat: Chat,
                      _ completion: @escaping CompletionType<[Participant]>,
                      _ uniqueIdResult: UniqueIdResultType? = nil)
    {
        chat.prepareToSendAsync(req: req, uniqueIdResult: uniqueIdResult) { response in
            completion(response.result as? [Participant], response.uniqueId, response.error)
        }
    }
}
