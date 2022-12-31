//
// Chat+RemoveTagParticipants.swift
// Copyright (c) 2022 FanapPodChatSDK
//
// Created by Hamed Hosseini on 12/14/22

import FanapPodAsyncSDK
import Foundation

// Request
public extension Chat {
    /// Remove tag participants from a tag.
    /// - Parameters:
    ///   - request: The tag id and the list of tag participants id.
    ///   - completion: List of removed tag participants.
    ///   - uniqueIdResult: The unique id of request. If you manage the unique id by yourself you should leave this closure blank, otherwise, you must use it if you need to know what response is for what request.
    func removeTagParticipants(_ request: RemoveTagParticipantsRequest, completion: @escaping CompletionType<[TagParticipant]>, uniqueIdResult: UniqueIdResultType? = nil) {
        prepareToSendAsync(req: request, uniqueIdResult: uniqueIdResult, completion: completion)
    }
}

// Response
extension Chat {
    func onRemoveTagParticipants(_ asyncMessage: AsyncMessage) {
        let response: ChatResponse<[TagParticipant]> = asyncMessage.toChatResponse()
        delegate?.chatEvent(event: .tag(.removeTagParticipant(response)))
        cache?.write(cacheType: .deleteTagParticipants(response.result ?? []))
        cache?.save()
        callbacksManager.invokeAndRemove(response, asyncMessage.chatMessage?.type)
    }
}
