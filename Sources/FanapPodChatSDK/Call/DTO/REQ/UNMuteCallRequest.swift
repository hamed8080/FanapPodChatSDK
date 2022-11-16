//
// UNMuteCallRequest.swift
// Copyright (c) 2022 FanapPodChatSDK
//
// Created by Hamed Hosseini on 9/27/22.

import Foundation
public class UNMuteCallRequest: BaseRequest, ChatSnedable, SubjectProtocol {
    let callId: Int
    let userIds: [Int]
    var subjectId: Int? { callId }
    var content: String? { userIds.convertCodableToString() }
    var chatMessageType: ChatMessageVOTypes = .unmuteCallParticipant

    public init(callId: Int, userIds: [Int], uniqueId: String? = nil) {
        self.callId = callId
        self.userIds = userIds
        super.init(uniqueId: uniqueId)
    }
}
