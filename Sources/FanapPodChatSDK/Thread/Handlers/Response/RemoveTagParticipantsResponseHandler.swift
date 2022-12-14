//
// RemoveTagParticipantsResponseHandler.swift
// Copyright (c) 2022 FanapPodChatSDK
//
// Created by Hamed Hosseini on 9/27/22.

import FanapPodAsyncSDK
import Foundation

class RemoveTagParticipantsResponseHandler: ResponseHandler {
    static func handle(_ asyncMessage: AsyncMessage) {
        guard let chatMessage = asyncMessage.chatMessage else { return }
        let chat = Chat.sharedInstance

        guard let data = chatMessage.content?.data(using: .utf8) else { return }
        guard let tagParticipants = try? JSONDecoder().decode([TagParticipant].self, from: data) else { return }
        chat.delegate?.chatEvent(event: .tag(.removeTagParticipant(tagParticipants)))
        CacheFactory.write(cacheType: .deleteTagParticipants(tagParticipants))
        CacheFactory.save()

        guard let callback = chat.callbacksManager.getCallBack(chatMessage.uniqueId) else { return }
        callback(.init(uniqueId: chatMessage.uniqueId, result: tagParticipants))
        chat.callbacksManager.removeCallback(uniqueId: chatMessage.uniqueId, requestType: .removeTagParticipants)
    }
}
