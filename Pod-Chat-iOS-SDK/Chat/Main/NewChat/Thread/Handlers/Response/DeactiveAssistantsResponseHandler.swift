//
//  DeactiveAssistantsResponseHandler.swift
//  FanapPodChatSDK
//
//  Created by Hamed Hosseini on 2/23/21.
//

import Foundation
import FanapPodAsyncSDK

public class DeactiveAssistantsResponseHandler : ResponseHandler {
    
    static func handle(_ chat: Chat, _ chatMessage: NewChatMessage, _ asyncMessage: AsyncMessage) {
        guard let callback = chat.callbacksManager.getCallBack(chatMessage.uniqueId)else {return}
        guard let data = chatMessage.content?.data(using: .utf8) else {return}
        guard let assistants = try? JSONDecoder().decode([Assistant].self, from: data) else{return}
        callback(.init(uniqueId:chatMessage.uniqueId , result: assistants))
    }
    
}
