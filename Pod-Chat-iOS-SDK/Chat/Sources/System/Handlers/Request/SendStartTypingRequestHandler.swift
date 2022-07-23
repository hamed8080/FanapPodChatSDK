//
//  SendStartTypingRequestHandler.swift
//  FanapPodChatSDK
//
//  Created by Hamed Hosseini on 3/15/21.
//

import Foundation
import FanapPodAsyncSDK
class SendStartTypingRequestHandler{
    
    static var isTypingCount = 0
    static var timer :Timer? = nil
    static var timerCheckUserStoppedTyping:Timer? = nil
    
    class func handle(_ threadId:Int , _ chat:Chat, onEndStartTyping:(()->())? = nil ){
        if isSendingIsTypingStarted(){
            stopTimerWhenUserIsNotTyping()
            return
        }
        isTypingCount  = 0
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){ _ in
            if (self.isTypingCount < 30) {
                self.isTypingCount += 1
                DispatchQueue.main.async {
                    Chat.sharedInstance.sendSignalMessage(req: .init(signalType: .IS_TYPING , threadId:threadId))
                }
            } else {
                stopTyping()
            }
        }
        stopTimerWhenUserIsNotTyping()
    }
    
    class func isSendingIsTypingStarted()->Bool{
        return timer != nil
    }
    
    class func stopTimerWhenUserIsNotTyping(){
        timerCheckUserStoppedTyping?.invalidate()
        timerCheckUserStoppedTyping = Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { timer in
            SendStartTypingRequestHandler.stopTyping()
        })
    }
    
    class func stopTyping(){
        timer?.invalidate()
        timer = nil
        isTypingCount = 0
    }
}
