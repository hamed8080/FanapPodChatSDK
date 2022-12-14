//
// ReplyMessageRequest.swift
// Copyright (c) 2022 FanapPodChatSDK
//
// Created by Hamed Hosseini on 9/27/22.

import Foundation
public class ReplyMessageRequest: SendTextMessageRequest {
    public init(threadId: Int,
                repliedTo: Int,
                textMessage: String,
                messageType: MessageType,
                metadata: String? = nil,
                systemMetadata: String? = nil,
                uniqueId: String? = nil)
    {
        super.init(threadId: threadId,
                   textMessage: textMessage,
                   messageType: messageType,
                   metadata: metadata,
                   repliedTo: repliedTo,
                   systemMetadata: systemMetadata,
                   uniqueId: uniqueId)
    }
}
