//
// UniqueIdManagerRequest.swift
// Copyright (c) 2022 FanapPodChatSDK
//
// Created by Hamed Hosseini on 9/27/22.

import Foundation
public class UniqueIdManagerRequest {
    public var uniqueId: String
    public var isAutoGenratedUniqueId = false

    public init(uniqueId: String? = nil) {
        isAutoGenratedUniqueId = uniqueId == nil
        self.uniqueId = uniqueId ?? UUID().uuidString
    }
}
