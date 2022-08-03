//
//  UnPinMessageResponseHandler.swift
//  FanapPodChatSDK
//
//  Created by Hamed Hosseini on 2/26/21.
//

import Foundation
import FanapPodAsyncSDK

class UnPinMessageResponseHandler: ResponseHandler {
    
    static func handle(_ asyncMessage: AsyncMessage) {
        guard let chatMessage = asyncMessage.chatMessage else {return}
		let chat = Chat.sharedInstance
        
        
        guard let data = chatMessage.content?.data(using: .utf8) else {return}
        guard let pinResponse = try? JSONDecoder().decode(PinUnpinMessage.self, from: data) else{return}
        chat.delegate?.chatEvent(event: .Thread(.MESSAGE_UNPIN(threadId: chatMessage.subjectId, pinResponse)))
        CacheFactory.write(cacheType: .UNPIN_MESSAGE(pinResponse, chatMessage.subjectId))
        PSM.shared.save()
        
        guard let callback = chat.callbacksManager.getCallBack(chatMessage.uniqueId)else {return}
        callback(.init(uniqueId:chatMessage.uniqueId , result: pinResponse))        
        chat.callbacksManager.removeCallback(uniqueId: chatMessage.uniqueId, requestType: .UNPIN_MESSAGE)
    }
}

