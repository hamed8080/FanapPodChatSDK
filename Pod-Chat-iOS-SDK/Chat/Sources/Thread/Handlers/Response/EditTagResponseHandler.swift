//
//  EditTagResponseHandler.swift
//  FanapPodChatSDK
//
//  Created by Hamed Hosseini on 2/22/21.
//

import Foundation
import FanapPodAsyncSDK

class EditTagResponseHandler: ResponseHandler {
	
    static func handle(_ chatMessage: ChatMessage, _ asyncMessage: AsyncMessage) {

		let chat = Chat.sharedInstance
		guard let callback = chat.callbacksManager.getCallBack(chatMessage.uniqueId)else {return}
		guard let data = chatMessage.content?.data(using: .utf8) else {return}
		guard let tag = try? JSONDecoder().decode(Tag.self, from: data) else{return}
		callback(.init(uniqueId:chatMessage.uniqueId , result: tag))
        CacheFactory.write(cacheType: .TAGS([tag]))
        PSM.shared.save()
        chat.callbacksManager.removeCallback(uniqueId: chatMessage.uniqueId, requestType: .EDIT_TAG)
	}
}
