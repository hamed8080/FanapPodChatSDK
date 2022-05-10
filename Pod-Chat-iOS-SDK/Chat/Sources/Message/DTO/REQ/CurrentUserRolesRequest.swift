//
//  CurrentUserRolesRequest.swift
//  FanapPodChatSDK
//
//  Created by Hamed Hosseini on 3/3/21.
//

import Foundation
public class CurrentUserRolesRequest: BaseRequest{
	
	public let threadId:Int
	
	public init(threadId:Int,uniqueId:String? = nil , typeCode:String? = nil) {
		self.threadId = threadId
        super.init(uniqueId: uniqueId, typeCode: typeCode)
	}
}
