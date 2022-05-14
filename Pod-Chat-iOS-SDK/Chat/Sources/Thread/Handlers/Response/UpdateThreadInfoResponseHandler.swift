//
//  UpdateThreadInfoResponseHandler.swift
//  FanapPodChatSDK
//
//  Created by Hamed Hosseini on 2/23/21.
//

import Foundation
import FanapPodAsyncSDK
import Alamofire


public class UpdateThreadInfoResponseHandler : ResponseHandler {
    
    static func handle(_ chatMessage: ChatMessage, _ asyncMessage: AsyncMessage) {
		let chat = Chat.sharedInstance
        chat.delegate?.chatEvent(event: .Thread(.init(type: .THREAD_INFO_UPDATED, chatMessage: chatMessage)))
        guard let callback = chat.callbacksManager.getCallBack(chatMessage.uniqueId)else {return}
        guard let data = chatMessage.content?.data(using: .utf8) else {return}
        guard let conversation = try? JSONDecoder().decode(Conversation.self, from: data) else{return}
        callback(.init(uniqueId:chatMessage.uniqueId , result: conversation))
        CacheFactory.write(cacheType: .THREADS([conversation]))
        PSM.shared.save()
        chat.callbacksManager.removeCallback(uniqueId: chatMessage.uniqueId, requestType: .THREAD_INFO_UPDATED)
    }
    
}
