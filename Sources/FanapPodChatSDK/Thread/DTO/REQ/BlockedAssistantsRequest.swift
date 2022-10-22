//
// BlockedAssistantsRequest.swift
// Copyright (c) 2022 FanapPodChatSDK
//
// Created by Hamed Hosseini on 9/27/22.

import Foundation
public class BlockedAssistantsRequest: BaseRequest {
    internal let count: Int
    internal let offset: Int

    public init(count: Int = 50, offset: Int = 0, uniqueId: String? = nil) {
        self.count = count
        self.offset = offset
        super.init(uniqueId: uniqueId)
    }

    private enum CodingKeys: String, CodingKey {
        case count
        case offset
    }

    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try? container.encodeIfPresent(count, forKey: .count)
        try? container.encodeIfPresent(offset, forKey: .offset)
    }
}
