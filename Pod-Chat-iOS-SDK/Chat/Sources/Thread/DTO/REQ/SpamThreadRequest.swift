//
//  SpamThreadRequest.swift
//  FanapPodChatSDK
//
//  Created by Hamed Hosseini on 3/16/21.
//

import Foundation
public class SpamThreadRequest: BaseRequest {
    
    public var threadId:Int
    
    public init(threadId:Int, uniqueId: String? = nil){
        self.threadId = threadId
        super.init(uniqueId: uniqueId)
    }
}
