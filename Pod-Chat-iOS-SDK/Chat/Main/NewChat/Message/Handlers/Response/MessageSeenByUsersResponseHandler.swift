//
//  MessageSeenByUsersResponseHandler.swift
//  FanapPodChatSDK
//
//  Created by Hamed Hosseini on 2/27/21.
//

import Foundation
class MessageSeenByUsersResponseHandler: ResponseHandler {
	
	static func handle(_ chat: Chat, _ chatMessage: NewChatMessage, _ asyncMessage: AsyncMessage) {
		guard let callback = chat.callbacksManager.getCallBack(chatMessage.uniqueId)else {return}
		guard let data = chatMessage.content?.data(using: .utf8) else {return}
		guard let history = try? JSONDecoder().decode([Participant].self, from: data) else{return}
        callback(.init(uniqueId: chatMessage.uniqueId ,result: history , contentCount: chatMessage.contentCount ?? 0))
		chat.callbacksManager.removeCallback(uniqueId: chatMessage.uniqueId)
	}
}

