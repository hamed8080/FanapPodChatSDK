//
//  JoinThreadResponseHandler.swift
//  FanapPodChatSDK
//
//  Created by Hamed Hosseini on 2/22/21.
//

import Foundation
import FanapPodAsyncSDK

class JoinThreadResponseHandler : ResponseHandler {
	
	static func handle(_ chatMessage: ChatMessage, _ asyncMessage: AsyncMessage) {
		
		let chat = Chat.sharedInstance
		guard let callback = chat.callbacksManager.getCallBack(chatMessage.uniqueId)else {return}
		guard let data = chatMessage.content?.data(using: .utf8) else {return}
		guard let conversation = try? JSONDecoder().decode(Conversation.self, from: data) else{return}
		callback(.init(uniqueId: chatMessage.uniqueId ,result: conversation))
        chat.callbacksManager.removeCallback(uniqueId: chatMessage.uniqueId, requestType: .JOIN_THREAD)
	}
	
}
