//
//  CreateTagRequestHandler.swift
//  FanapPodChatSDK
//
//  Created by Hamed Hosseini on 3/3/21.
//

import Foundation
class CreateTagRequestHandler {
    
    class func handle( _ req:CreateTagRequest ,
                       _ chat:Chat,
                       _ completion: @escaping  CompletionType<Tag>,
                       _ uniqueIdResult: UniqueIdResultType = nil
    ){
        chat.prepareToSendAsync(req: req,
                                clientSpecificUniqueId: req.uniqueId,
                                messageType: .CREATE_TAG,
                                uniqueIdResult: uniqueIdResult){ response in
            completion(response.result as? Tag , response.uniqueId, response.error )
        }
    }
    
}


