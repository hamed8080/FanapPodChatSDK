//
// SpamPvThreadResponseHandler.swift
// Copyright (c) 2022 FanapPodChatSDK
//
// Created by Hamed Hosseini on 9/27/22.

import FanapPodAsyncSDK
import Foundation

class SpamPvThreadResponseHandler: ResponseHandler {
    static func handle(_ asyncMessage: AsyncMessage) {
        guard let chatMessage = asyncMessage.chatMessage else { return }
        let chat = Chat.sharedInstance
        guard let callback = chat.callbacksManager.getCallBack(chatMessage.uniqueId) else { return }
        guard let data = chatMessage.content?.data(using: .utf8) else { return }
        guard let blockedUser = try? JSONDecoder().decode(BlockedContact.self, from: data) else { return }
        callback(.init(uniqueId: chatMessage.uniqueId, result: blockedUser))
        chat.callbacksManager.removeCallback(uniqueId: chatMessage.uniqueId, requestType: .spamPvThread)
    }
}
