//
//  EditTagResponseHandler.swift
//  FanapPodChatSDK
//
//  Created by Hamed Hosseini on 2/22/21.
//

import Foundation
import FanapPodAsyncSDK

class EditTagResponseHandler: ResponseHandler {
	
    static func handle(_ asyncMessage: AsyncMessage) {
        guard let chatMessage = asyncMessage.chatMessage else {return}
		let chat = Chat.sharedInstance
		
		guard let data = chatMessage.content?.data(using: .utf8) else {return}
		guard let tag = try? JSONDecoder().decode(Tag.self, from: data) else{return}
        chat.delegate?.chatEvent(event: .Tag(.init(tag: tag, type: .EDIT_TAG)))
        CacheFactory.write(cacheType: .TAGS([tag]))
        PSM.shared.save()
        
        guard let callback = chat.callbacksManager.getCallBack(chatMessage.uniqueId)else {return}
        callback(.init(uniqueId:chatMessage.uniqueId , result: tag))
        chat.callbacksManager.removeCallback(uniqueId: chatMessage.uniqueId, requestType: .EDIT_TAG)
	}
}
