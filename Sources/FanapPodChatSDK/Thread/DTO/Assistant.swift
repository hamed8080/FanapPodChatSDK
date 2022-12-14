//
// Assistant.swift
// Copyright (c) 2022 FanapPodChatSDK
//
// Created by Hamed Hosseini on 9/27/22.

import Foundation

open class Assistant: Codable {
    public var contactType: String?
    public var assistant: Invitee?
    public var participant: Participant?
    public var roleTypes: [Roles]?
    public var block: Bool

    private enum CodingKeys: String, CodingKey {
        case contactType
        case assistant
        case participantVO // for decoder
        case participant // for encoder
        case roleTypes
        case block
    }

    public init(assistant: Invitee? = nil,
                contactType: String? = nil,
                participant: Participant? = nil,
                block: Bool = false,
                roleTypes: [Roles]? = nil)
    {
        self.contactType = contactType
        self.assistant = assistant
        self.participant = participant
        self.roleTypes = roleTypes
        self.block = block
    }

    public required init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: CodingKeys.self)
        contactType = try container?.decodeIfPresent(String.self, forKey: .contactType)
        assistant = try container?.decodeIfPresent(Invitee.self, forKey: .assistant)
        participant = try container?.decodeIfPresent(Participant.self, forKey: .participantVO)
        roleTypes = try container?.decodeIfPresent([Roles].self, forKey: .roleTypes)
        block = (try container?.decodeIfPresent(Bool.self, forKey: .block)) ?? false
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(participant, forKey: .participant)
        try container.encodeIfPresent(contactType, forKey: .contactType)
        try container.encodeIfPresent(assistant, forKey: .assistant)
        try container.encodeIfPresent(roleTypes, forKey: .roleTypes)
    }
}
