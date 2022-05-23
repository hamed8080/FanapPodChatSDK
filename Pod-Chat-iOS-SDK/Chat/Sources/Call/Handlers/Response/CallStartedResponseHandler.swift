//
//  CallStartedResponseHandler.swift
//  FanapPodChatSDK
//
//  Created by Hamed Hosseini on 6/29/21.
//

import Foundation
import FanapPodAsyncSDK

class CallStartedResponseHandler {
    
    static func handle(_ chatMessage: ChatMessage, _ asyncMessage: AsyncMessage) {
        
        let chat = Chat.sharedInstance
        guard let data = chatMessage.content?.data(using: .utf8) else {return}
        
        guard var callStarted = try? JSONDecoder().decode(StartCall.self, from: data) else{return}
        chat.delegate?.chatEvent(event: .Call(CallEventModel(type: .CALL_STARTED(callStarted))))
        chat.callState = .Started
        
        callStarted.callId = chatMessage.subjectId
        chat.callbacksManager.callStartedDelegate?(callStarted,chatMessage.uniqueId)
    }
}
