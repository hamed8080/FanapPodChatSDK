//
//  PinUnpinThreadRequest.swift
//  FanapPodChatSDK
//
//  Created by MahyarZhiani on 10/7/1398 AP.
//  Copyright © 1398 Mahyar Zhiani. All rights reserved.
//

import Foundation

@available(*,deprecated , message:"Removed in XX.XX.XX version.")
open class PinUnpinThreadRequest {
    
    public let threadId:    Int
    
    public let typeCode:    String?
    public let uniqueId:    String
    
    public init(threadId:  Int,
                typeCode:   String?,
                uniqueId:   String?) {
        
        self.threadId   = threadId
        
        self.typeCode   = typeCode
        self.uniqueId   = uniqueId ?? UUID().uuidString
    }
    
}

@available(*,deprecated , message:"Removed in XX.XX.XX version.")
open class PinAndUnpinThreadRequestModel: PinUnpinThreadRequest {
    
}
