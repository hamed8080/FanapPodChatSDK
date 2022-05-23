//
//  CreateBotResponseHandler.swift
//  FanapPodChatSDK
//
//  Created by Hamed Hosseini on 2/24/21.
//

import Foundation
import FanapPodAsyncSDK

class CreateBotResponseHandler: ResponseHandler {
	
	static func handle(_ chatMessage: ChatMessage, _ asyncMessage: AsyncMessage) {
		let chat = Chat.sharedInstance
		
		guard let data = chatMessage.content?.data(using: .utf8) else {return}
		guard let bot = try? JSONDecoder().decode(Bot.self, from: data) else{return}
        chat.delegate?.chatEvent(event: .Bot(.init(type: .CREATE_BOT, bot: bot)))
        
        guard let callback = chat.callbacksManager.getCallBack(chatMessage.uniqueId)else {return}
        callback(.init(uniqueId: chatMessage.uniqueId ,result: bot))
        chat.callbacksManager.removeCallback(uniqueId: chatMessage.uniqueId, requestType: .CREATE_BOT)
	}
}
