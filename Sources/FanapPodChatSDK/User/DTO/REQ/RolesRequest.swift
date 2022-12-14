//
// RolesRequest.swift
// Copyright (c) 2022 FanapPodChatSDK
//
// Created by Hamed Hosseini on 9/27/22.

import Foundation
public class RolesRequest: UniqueIdManagerRequest, ChatSendable, SubjectProtocol {
    public let userRoles: [UserRoleRequest]
    public let threadId: Int
    var content: String? { userRoles.convertCodableToString() }
    var subjectId: Int { threadId }
    var chatMessageType: ChatMessageVOTypes = .getCurrentUserRoles

    public init(userRoles: [UserRoleRequest], threadId: Int, uniqueId: String? = nil) {
        self.userRoles = userRoles
        self.threadId = threadId
        super.init(uniqueId: uniqueId)
    }
}

public class AuditorRequest: RolesRequest {
    public init(userRoleRequest: UserRoleRequest, threadId: Int, uniqueId: String? = nil) {
        super.init(userRoles: [userRoleRequest], threadId: threadId, uniqueId: uniqueId)
    }
}

public class UserRoleRequest: Encodable {
    private let userId: Int
    private var roles: [Roles] = []

    public init(userId: Int, roles: [Roles]) {
        self.roles = roles
        self.userId = userId
    }

    private enum CodingKeys: String, CodingKey {
        case userId
        case roles
        case checkThreadMembership
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(userId, forKey: .userId)
        try container.encode(roles, forKey: .roles)
        try container.encode(false, forKey: .checkThreadMembership)
    }
}
