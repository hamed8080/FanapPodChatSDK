//
// ForwardMessageRequest.swift
// Copyright (c) 2022 FanapPodChatSDK
//
// Created by Hamed Hosseini on 9/27/22.

import Foundation
public class ForwardMessageRequest: UniqueIdManagerRequest, Queueable, PlainTextSendable, SubjectProtocol {
    public var queueTime: Date = .init()
    public let messageIds: [Int]
    public let fromThreadId: Int
    public let threadId: Int
    public var uniqueIds: [String]
    var chatMessageType: ChatMessageVOTypes = .forwardMessage
    var subjectId: Int { threadId }
    var content: String? { "\(messageIds)" }

    public init(fromThreadId: Int,
                threadId: Int,
                messageIds: [Int],
                uniqueIds: [String] = [])
    {
        self.fromThreadId = fromThreadId
        self.threadId = threadId
        self.messageIds = messageIds
        self.uniqueIds = uniqueIds
        if self.uniqueIds.count == 0 {
            var uniqueIds: [String] = []
            for _ in messageIds {
                uniqueIds.append(UUID().uuidString)
            }
            self.uniqueIds = uniqueIds
        }
        super.init(uniqueId: "\(self.uniqueIds)")
    }
}
