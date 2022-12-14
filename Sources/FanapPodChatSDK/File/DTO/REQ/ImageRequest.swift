//
// ImageRequest.swift
// Copyright (c) 2022 FanapPodChatSDK
//
// Created by Hamed Hosseini on 9/27/22.

import Foundation

public enum ImageSize: String, Encodable {
    case SMALL
    case MEDIUM
    case LARG
    case ACTUAL
}

public class ImageRequest: UniqueIdManagerRequest, Encodable {
    public let hashCode: String
    public var forceToDownloadFromServer: Bool
    public let quality: Float?
    public let size: ImageSize?
    public let crop: Bool?
    public let isThumbnail: Bool
    public let checkUserGroupAccess: Bool

    public init(hashCode: String, checkUserGroupAccess: Bool = true, forceToDownloadFromServer: Bool = false, isThumbnail: Bool = false, quality: Float? = nil, size: ImageSize? = nil, crop: Bool? = nil) {
        self.hashCode = hashCode
        self.forceToDownloadFromServer = forceToDownloadFromServer
        self.size = size
        self.crop = crop
        self.isThumbnail = isThumbnail
        self.checkUserGroupAccess = checkUserGroupAccess
        if isThumbnail {
            self.quality = 0.123
        } else {
            self.quality = quality
        }
    }

    private enum CodingKeys: String, CodingKey {
        case size
        case quality
        case crop
        case checkUserGroupAccess
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try? container.encodeIfPresent(size, forKey: .size)
        try? container.encodeIfPresent(crop, forKey: .crop)
        try? container.encodeIfPresent(quality, forKey: .quality)
        try? container.encodeIfPresent(checkUserGroupAccess, forKey: .checkUserGroupAccess)
    }
}
