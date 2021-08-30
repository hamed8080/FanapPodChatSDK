//
//  NewSendChatMessageVO.swift
//  FanapPodChatSDK
//
//  Created by MahyarZhiani on 10/4/1398 AP.
//  Copyright © 1398 Mahyar Zhiani. All rights reserved.
//

import Foundation
import SwiftyJSON

public struct NewSendChatMessageVO : Encodable {
    
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
