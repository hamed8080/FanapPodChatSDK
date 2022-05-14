//
//  SendChatMessageVO.h
//  FanapPodChatSDK
//
//  Created by Hamed Hosseini on 11/1/21.
//

import Foundation


public struct SendChatMessageVO : Encodable {
    public init(type:               Int,
                token:              String,
                content:            String?     = nil,
                messageType:        Int?        = nil,
                metadata:           String?     = nil,
                repliedTo:          Int?        = nil,
                systemMetadata:     String?     = nil,
                subjectId:          Int?        = nil,
                tokenIssuer:        Int         = 1,
                typeCode:           String?     = nil,
                uniqueId:           String?     = nil
    ) {
        self.type               = type
        self.token              = token
        self.content            = content
        self.messageType        = messageType
        self.metadata           = metadata
        self.repliedTo          = repliedTo
        self.systemMetadata     = systemMetadata
        self.subjectId          = subjectId
        self.tokenIssuer        = tokenIssuer
        self.typeCode           = typeCode
        self.uniqueId           = uniqueId
    }
    
    
	var type                         : Int?       = nil
	let token                        : String
	var content                      : String?    = nil
	var messageType                  : Int?       = nil
	var metadata                     : String?    = nil
	var repliedTo                    : Int?       = nil
	var systemMetadata               : String?    = nil
	var subjectId                    : Int?       = nil
	var tokenIssuer                  : Int        = 1
	var typeCode                     : String?    = nil
	var uniqueId                     : String?    = nil
}
