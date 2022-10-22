//
// MessageGaps+CoreDataProperties.swift
// Copyright (c) 2022 FanapPodChatSDK
//
// Created by Hamed Hosseini on 9/27/22.

import CoreData
import Foundation

public extension MessageGaps {
    @NSManaged var messageId: NSNumber?
    @NSManaged var threadId: NSNumber?
    @NSManaged var previousId: NSNumber?
}
