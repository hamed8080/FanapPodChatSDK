//
//  SentMessageResponseHandler.swift
//  FanapPodChatSDK
//
//  Created by Hamed Hosseini on 3/5/21.
//

import Foundation
import FanapPodAsyncSDK

class SentMessageResponseHandler: ResponseHandler {
    
    static func handle(_ asyncMessage: AsyncMessage) {
        guard let chatMessage = asyncMessage.chatMessage else {return}
		let chat = Chat.sharedInstance
        
        let message = Message(chatMessage: chatMessage)
        chat.delegate?.chatEvent(event: .Message(.MESSAGE_SEND(message)))
        CacheFactory.write(cacheType: .DELETE_SEND_TXET_MESSAGE_QUEUE(chatMessage.uniqueId))
        CacheFactory.write(cacheType: .DELETE_FORWARD_MESSAGE_QUEUE(chatMessage.uniqueId))
        CacheFactory.write(cacheType: .DELETE_FILE_MESSAGE_QUEUE(chatMessage.uniqueId))
        PSM.shared.save()
        
        guard let callback = Chat.sharedInstance.callbacksManager.getSentCallback(chatMessage.uniqueId) else {return}        
        let messageResponse = SentMessageResponse(isSent: true, messageId: message.id, threadId: chatMessage.subjectId, message: message, participantId: chatMessage.participantId)
        callback?(messageResponse , chatMessage.uniqueId , nil)
        chat.callbacksManager.removeSentCallback(uniqueId: chatMessage.uniqueId)
    }
}
