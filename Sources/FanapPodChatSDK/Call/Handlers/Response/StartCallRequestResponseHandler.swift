//
// StartCallRequestResponseHandler.swift
// Copyright (c) 2022 FanapPodChatSDK
//
// Created by Hamed Hosseini on 9/27/22.

import FanapPodAsyncSDK
import Foundation

class StartCallRequestResponseHandler {
    /// Only call on receivers side. The starter of call never get this event.
    static func handle(_ asyncMessage: AsyncMessage) {
        guard let chatMessage = asyncMessage.chatMessage else { return }
        let chat = Chat.sharedInstance
        guard let data = chatMessage.content?.data(using: .utf8) else { return }
        guard let createCall = try? JSONDecoder().decode(CreateCall.self, from: data) else { return }

        chat.delegate?.chatEvent(event: .call(CallEventModel(type: .callReceived(createCall))))
        chat.callState = .requested
        startTimerTimeout(callId: createCall.callId)

        // SEND type 73 . This mean client receive call and showing ringing mode on call creator.
        chat.callReceived(.init(subjectId: createCall.callId))

        chat.callbacksManager.callRequestArriveDelegate?(createCall, chatMessage.uniqueId)
    }

    /// maybe starter of call after start call request disconnected we need to close ui on the receiver side
    class func startTimerTimeout(callId: Int) {
        let chat = Chat.sharedInstance
        Timer.scheduledTimer(withTimeInterval: chat.config?.callTimeout ?? 0, repeats: false) { timer in
            if chat.callState == .requested {
                if chat.config?.isDebuggingLogEnabled == true {
                    Chat.sharedInstance.logger?.log(title: "cancel call after \(chat.config?.callTimeout ?? 0) second")
                }
                chat.delegate?.chatEvent(event: .call(CallEventModel(type: .callEnded(callId))))
                chat.callState = .ended
            }
            timer.invalidate()
        }
    }
}
