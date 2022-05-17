//
//  SetProfileResponseHandler.swift
//  FanapPodChatSDK
//
//  Created by Hamed Hosseini on 2/24/21.
//

import Foundation
import FanapPodAsyncSDK

class SetProfileResponseHandler: ResponseHandler{
	
	static func handle(_ chatMessage: ChatMessage, _ asyncMessage: AsyncMessage) {
		
		let chat = Chat.sharedInstance
		
		guard let data = chatMessage.content?.data(using: .utf8) else {return}
		guard let profile = try? JSONDecoder().decode(Profile.self, from: data) else {return}
        
        guard let callback = chat.callbacksManager.getCallBack(chatMessage.uniqueId)else {return}
		callback(.init(uniqueId:chatMessage.uniqueId , result: profile))
        chat.callbacksManager.removeCallback(uniqueId: chatMessage.uniqueId, requestType: .SET_PROFILE)
	}
}
