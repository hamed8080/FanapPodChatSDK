//
// CreateThreadWithFileMessageRequestHandler.swift
// Copyright (c) 2022 FanapPodChatSDK
//
// Created by Hamed Hosseini on 9/27/22.

import Foundation
class CreateThreadWithFileMessageRequestHandler {
    class func handle(_ chat: Chat,
                      _ request: CreateThreadRequest,
                      _ textMessage: SendTextMessageRequest,
                      _ uploadFile: UploadFileRequest,
                      _ uploadProgress: UploadFileProgressType? = nil,
                      _ onSent: OnSentType? = nil,
                      _ onSeen: OnSeenType? = nil,
                      _ onDeliver: OnDeliveryType? = nil,
                      _ createThreadCompletion: CompletionType<Conversation>? = nil,
                      _ uploadUniqueIdResult: UniqueIdResultType? = nil,
                      _ messageUniqueIdResult: UniqueIdResultType? = nil)
    {
        chat.prepareToSendAsync(req: request, uniqueIdResult: nil) { response in

            guard let thread = response.result as? Conversation, let id = thread.id else { return }
            createThreadCompletion?(thread, nil, nil)
            textMessage.threadId = id
            uploadFile.userGroupHash = thread.userGroupHash
            chat.sendFileMessage(textMessage: textMessage,
                                 uploadFile: uploadFile,
                                 uploadProgress: uploadProgress,
                                 onSent: onSent,
                                 onSeen: onSeen,
                                 onDeliver: onDeliver,
                                 uploadUniqueIdResult: uploadUniqueIdResult,
                                 messageUniqueIdResult: messageUniqueIdResult)
        }
    }
}
