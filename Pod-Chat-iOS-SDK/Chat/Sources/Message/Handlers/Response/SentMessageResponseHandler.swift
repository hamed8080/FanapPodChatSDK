//
//  SentMessageResponseHandler.swift
//  FanapPodChatSDK
//
//  Created by Hamed Hosseini on 3/5/21.
//

import Foundation
import FanapPodAsyncSDK

class SentMessageResponseHandler: ResponseHandler {
    
    static func handle(_ chatMessage: ChatMessage, _ asyncMessage: AsyncMessage) {
        
		let chat = Chat.sharedInstance
        if let callback = Chat.sharedInstance.callbacksManager.getSentCallback(chatMessage.uniqueId) {
            chat.delegate?.chatEvent(event: .Message( .init(type: .MESSAGE_SEND, chatMessage: chatMessage)))
            let message = Message(chatMessage: chatMessage)
            let messageResponse = SentMessageResponse(isSent: true, messageId: message.id, threadId: chatMessage.subjectId, message: message, participantId: chatMessage.participantId)
            callback?(messageResponse , chatMessage.uniqueId , nil)
            CacheFactory.write(cacheType: .DELETE_SEND_TXET_MESSAGE_QUEUE(chatMessage.uniqueId))
            CacheFactory.write(cacheType: .DELETE_FORWARD_MESSAGE_QUEUE(chatMessage.uniqueId))
            CacheFactory.write(cacheType: .DELETE_FILE_MESSAGE_QUEUE(chatMessage.uniqueId))
            PSM.shared.save()
            chat.callbacksManager.removeSentCallback(uniqueId: chatMessage.uniqueId)
        }
    }
}
