//
// IsThreadNamePublicRequest.swift
// Copyright (c) 2022 FanapPodChatSDK
//
// Created by Hamed Hosseini on 9/27/22.

import Foundation

public class IsThreadNamePublicRequest: UniqueIdManagerRequest, ChatSendable {
    public let name: String
    var chatMessageType: ChatMessageVOTypes = .isNameAvailable
    var content: String? { convertCodableToString() }

    public init(name: String, uniqueId: String? = nil) {
        self.name = name
        super.init(uniqueId: uniqueId)
    }

    private enum CodingKeys: String, CodingKey {
        case name
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try? container.encode(name, forKey: .name)
    }
}
