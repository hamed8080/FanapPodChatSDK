//
// Conversation.swift
// Copyright (c) 2022 FanapPodChatSDK
//
// Created by Hamed Hosseini on 9/27/22.

import Foundation

open class Conversation: Codable, Hashable {
    public static func == (lhs: Conversation, rhs: Conversation) -> Bool {
        lhs.id == rhs.id
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    public var admin: Bool?
    public var canEditInfo: Bool?
    public var canSpam: Bool = false
    public var closedThread: Bool = false
    public var description: String?
    public var group: Bool?
    public var id: Int?
    public var image: String?
    public var joinDate: Int?
    public var lastMessage: String?
    public var lastParticipantImage: String?
    public var lastParticipantName: String?
    public var lastSeenMessageId: Int?
    public var lastSeenMessageNanos: UInt?
    public var lastSeenMessageTime: UInt?
    public var mentioned: Bool?
    public var metadata: String?
    public var mute: Bool?
    public var participantCount: Int?
    public var partner: Int?
    public var partnerLastDeliveredMessageId: Int?
    public var partnerLastDeliveredMessageNanos: UInt?
    public var partnerLastDeliveredMessageTime: UInt?
    public var partnerLastSeenMessageId: Int?
    public var partnerLastSeenMessageNanos: UInt?
    public var partnerLastSeenMessageTime: UInt?
    public var pin: Bool?
    public var time: UInt?
    public var title: String?
    public var type: ThreadTypes?
    public var unreadCount: Int?
    public var uniqueName: String?
    public var userGroupHash: String?
    public var inviter: Participant?
    public var lastMessageVO: Message?
    public var participants: [Participant]?
    public var pinMessage: PinUnpinMessage?

    public init(admin: Bool? = nil,
                canEditInfo: Bool? = nil,
                canSpam: Bool? = nil,
                closedThread: Bool? = nil,
                description: String? = nil,
                group: Bool? = nil,
                id: Int? = nil,
                image: String? = nil,
                joinDate: Int? = nil,
                lastMessage: String? = nil,
                lastParticipantImage: String? = nil,
                lastParticipantName: String? = nil,
                lastSeenMessageId: Int? = nil,
                lastSeenMessageNanos: UInt? = nil,
                lastSeenMessageTime: UInt? = nil,
                mentioned: Bool? = nil,
                metadata: String? = nil,
                mute: Bool? = nil,
                participantCount: Int? = nil,
                partner: Int? = nil,
                partnerLastDeliveredMessageId: Int? = nil,
                partnerLastDeliveredMessageNanos: UInt? = nil,
                partnerLastDeliveredMessageTime: UInt? = nil,
                partnerLastSeenMessageId: Int? = nil,
                partnerLastSeenMessageNanos: UInt? = nil,
                partnerLastSeenMessageTime: UInt? = nil,
                pin: Bool? = nil,
                time: UInt? = nil,
                title: String? = nil,
                type: ThreadTypes? = nil,
                unreadCount: Int? = nil,
                uniqueName: String? = nil,
                userGroupHash: String? = nil,
                inviter: Participant? = nil,
                lastMessageVO: Message? = nil,
                participants: [Participant]? = nil,
                pinMessage: PinUnpinMessage? = nil)
    {
        self.admin = admin
        self.canEditInfo = canEditInfo
        self.canSpam = canSpam ?? false
        self.closedThread = closedThread ?? false
        self.description = description
        self.group = group
        self.id = id
        self.image = image
        self.joinDate = joinDate
        self.lastMessage = lastMessage
        self.lastParticipantImage = lastParticipantImage
        self.lastParticipantName = lastParticipantName
        self.lastSeenMessageId = lastSeenMessageId
        self.lastSeenMessageNanos = lastSeenMessageNanos
        self.lastSeenMessageTime = lastSeenMessageTime
        self.mentioned = mentioned
        self.metadata = metadata
        self.mute = mute
        self.participantCount = participantCount
        self.partner = partner
        self.partnerLastDeliveredMessageId = partnerLastDeliveredMessageId
        self.partnerLastDeliveredMessageNanos = partnerLastDeliveredMessageNanos
        self.partnerLastDeliveredMessageTime = partnerLastDeliveredMessageTime
        self.partnerLastSeenMessageId = partnerLastSeenMessageId
        self.partnerLastSeenMessageNanos = partnerLastSeenMessageNanos
        self.partnerLastSeenMessageTime = partnerLastSeenMessageTime
        self.pin = pin
        self.time = time
        self.title = title
        self.type = type
        self.unreadCount = unreadCount
        self.uniqueName = uniqueName
        self.userGroupHash = userGroupHash

        self.inviter = inviter
        self.lastMessageVO = lastMessageVO
        self.participants = participants
        self.pinMessage = pinMessage
    }

    public init(theConversation: Conversation) {
        admin = theConversation.admin
        canEditInfo = theConversation.canEditInfo
        canSpam = theConversation.canSpam
        closedThread = theConversation.closedThread
        description = theConversation.description
        group = theConversation.group
        id = theConversation.id
        image = theConversation.image
        joinDate = theConversation.joinDate
        lastMessage = theConversation.lastMessage
        lastParticipantImage = theConversation.lastParticipantImage
        lastParticipantName = theConversation.lastParticipantName
        lastSeenMessageId = theConversation.lastSeenMessageId
        lastSeenMessageNanos = theConversation.lastSeenMessageNanos
        lastSeenMessageTime = theConversation.lastSeenMessageTime
        mentioned = theConversation.mentioned
        metadata = theConversation.metadata
        mute = theConversation.mute
        participantCount = theConversation.participantCount
        partner = theConversation.partner
        partnerLastDeliveredMessageId = theConversation.partnerLastDeliveredMessageId
        partnerLastDeliveredMessageNanos = theConversation.partnerLastDeliveredMessageNanos
        partnerLastDeliveredMessageTime = theConversation.partnerLastDeliveredMessageTime
        partnerLastSeenMessageId = theConversation.partnerLastSeenMessageId
        partnerLastSeenMessageNanos = theConversation.partnerLastSeenMessageNanos
        partnerLastSeenMessageTime = theConversation.partnerLastSeenMessageTime
        pin = theConversation.pin
        time = theConversation.time
        title = theConversation.title
        type = theConversation.type
        unreadCount = theConversation.unreadCount
        uniqueName = theConversation.uniqueName
        userGroupHash = theConversation.userGroupHash

        inviter = theConversation.inviter
        lastMessageVO = theConversation.lastMessageVO
        participants = theConversation.participants
        pinMessage = theConversation.pinMessage
    }

    private enum CodingKeys: String, CodingKey {
        case admin
        case canEditInfo
        case canSpam
        case closedThread
        case description
        case group
        case id
        case image
        case joinDate
        case lastMessage
        case lastParticipantImage
        case lastParticipantName
        case lastSeenMessageId
        case lastSeenMessageNanos
        case lastSeenMessageTime
        case mentioned
        case metadata
        case mute
        case participantCount
        case partner
        case partnerLastDeliveredMessageId
        case partnerLastDeliveredMessageNanos
        case partnerLastDeliveredMessageTime
        case partnerLastSeenMessageId
        case partnerLastSeenMessageNanos
        case partnerLastSeenMessageTime
        case pin
        case pinned
        case time
        case title
        case type
        case unreadCount
        case uniqueName
        case userGroupHash
        case inviter
        case participants
        case lastMessageVO
        case pinMessageVO
        case pinMessage // only in encode
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        admin = try container.decodeIfPresent(Bool.self, forKey: .admin)
        canEditInfo = try container.decodeIfPresent(Bool.self, forKey: .canEditInfo)
        canSpam = try container.decodeIfPresent(Bool.self, forKey: .canSpam) ?? false
        closedThread = try container.decodeIfPresent(Bool.self, forKey: .closedThread) ?? false
        description = try container.decodeIfPresent(String.self, forKey: .description)
        group = try container.decodeIfPresent(Bool.self, forKey: .group)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
        image = try container.decodeIfPresent(String.self, forKey: .image)
        joinDate = try container.decodeIfPresent(Int.self, forKey: .joinDate)
        lastMessage = try container.decodeIfPresent(String.self, forKey: .lastMessage)
        lastParticipantImage = try container.decodeIfPresent(String.self, forKey: .lastParticipantImage)
        lastParticipantName = try container.decodeIfPresent(String.self, forKey: .lastParticipantName)
        lastSeenMessageId = try container.decodeIfPresent(Int.self, forKey: .lastSeenMessageId)
        lastSeenMessageNanos = try container.decodeIfPresent(UInt.self, forKey: .lastSeenMessageNanos)
        lastSeenMessageTime = try container.decodeIfPresent(UInt.self, forKey: .lastSeenMessageTime)
        mentioned = try container.decodeIfPresent(Bool.self, forKey: .mentioned)
        metadata = try container.decodeIfPresent(String.self, forKey: .metadata)
        mute = try container.decodeIfPresent(Bool.self, forKey: .mute)
        participantCount = try container.decodeIfPresent(Int.self, forKey: .participantCount)
        partner = try container.decodeIfPresent(Int.self, forKey: .partner)
        partnerLastDeliveredMessageId = try container.decodeIfPresent(Int.self, forKey: .partnerLastSeenMessageId)
        partnerLastDeliveredMessageNanos = try container.decodeIfPresent(UInt.self, forKey: .partnerLastDeliveredMessageNanos)
        partnerLastDeliveredMessageTime = try container.decodeIfPresent(UInt.self, forKey: .partnerLastDeliveredMessageTime)
        partnerLastSeenMessageId = try container.decodeIfPresent(Int.self, forKey: .partnerLastSeenMessageId)
        partnerLastSeenMessageNanos = try container.decodeIfPresent(UInt.self, forKey: .partnerLastSeenMessageNanos)
        partnerLastSeenMessageTime = try container.decodeIfPresent(UInt.self, forKey: .partnerLastSeenMessageTime)
        pin = try container.decodeIfPresent(Bool.self, forKey: .pin) ?? container.decodeIfPresent(Bool.self, forKey: .pinned)
        time = try container.decodeIfPresent(UInt.self, forKey: .time)
        title = try container.decodeIfPresent(String.self, forKey: .title)
        type = try container.decodeIfPresent(ThreadTypes.self, forKey: .type)
        unreadCount = try container.decodeIfPresent(Int.self, forKey: .unreadCount)
        uniqueName = try container.decodeIfPresent(String.self, forKey: .uniqueName)
        userGroupHash = try container.decodeIfPresent(String.self, forKey: .userGroupHash)
        inviter = try container.decodeIfPresent(Participant.self, forKey: .inviter)
        participants = try container.decodeIfPresent([Participant].self, forKey: .participants)
        lastMessageVO = try container.decodeIfPresent(Message.self, forKey: .lastMessageVO)
        pinMessage = try container.decodeIfPresent(PinUnpinMessage.self, forKey: .pinMessageVO)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(admin, forKey: .admin)
        try container.encodeIfPresent(canEditInfo, forKey: .canEditInfo)
        try container.encodeIfPresent(canSpam, forKey: .canSpam)
        try container.encodeIfPresent(closedThread, forKey: .closedThread)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(group, forKey: .group)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(image, forKey: .image)
        try container.encodeIfPresent(joinDate, forKey: .joinDate)
        try container.encodeIfPresent(lastMessage, forKey: .lastMessage)
        try container.encodeIfPresent(lastParticipantImage, forKey: .lastParticipantImage)
        try container.encodeIfPresent(lastParticipantName, forKey: .lastParticipantName)
        try container.encodeIfPresent(lastSeenMessageId, forKey: .lastSeenMessageId)
        try container.encodeIfPresent(lastSeenMessageNanos, forKey: .lastSeenMessageNanos)
        try container.encodeIfPresent(lastSeenMessageTime, forKey: .lastSeenMessageTime)
        try container.encodeIfPresent(mentioned, forKey: .mentioned)
        try container.encodeIfPresent(metadata, forKey: .metadata)
        try container.encodeIfPresent(mute, forKey: .mute)
        try container.encodeIfPresent(participantCount, forKey: .participantCount)
        try container.encodeIfPresent(partner, forKey: .partner)
        try container.encodeIfPresent(partnerLastDeliveredMessageId, forKey: .partnerLastDeliveredMessageId)
        try container.encodeIfPresent(partnerLastDeliveredMessageNanos, forKey: .partnerLastDeliveredMessageNanos)
        try container.encodeIfPresent(partnerLastDeliveredMessageTime, forKey: .partnerLastDeliveredMessageTime)
        try container.encodeIfPresent(partnerLastSeenMessageId, forKey: .partnerLastSeenMessageId)
        try container.encodeIfPresent(partnerLastSeenMessageNanos, forKey: .partnerLastSeenMessageNanos)
        try container.encodeIfPresent(partnerLastSeenMessageTime, forKey: .partnerLastSeenMessageTime)
        try container.encodeIfPresent(pin, forKey: .pin)
        try container.encodeIfPresent(time, forKey: .time)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(unreadCount, forKey: .unreadCount)
        try container.encodeIfPresent(uniqueName, forKey: .uniqueName)
        try container.encodeIfPresent(userGroupHash, forKey: .userGroupHash)
        try container.encodeIfPresent(inviter, forKey: .inviter)
        try container.encodeIfPresent(lastMessageVO, forKey: .lastMessageVO)
        try container.encodeIfPresent(participants, forKey: .participants)
        try container.encodeIfPresent(pinMessage, forKey: .pinMessage)
    }
}
