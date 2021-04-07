//
//  ContactsLastSeenResponseHandler.swift
//  FanapPodChatSDK
//
//  Created by Hamed Hosseini on 2/17/21.
//

import Foundation
class ContactsLastSeenResponseHandler {
	
	static func handle(_ chat: Chat, _ chatMessage: NewChatMessage, _ asyncMessage: AsyncMessage) {

		guard let data = chatMessage.content?.data(using: .utf8) else {return}
		guard let users = try? JSONDecoder().decode([UserLastSeenDuration].self, from: data) else{return}
        chat.delegate?.contactEvents(model: .init(type: .CONTACTS_LAST_SEEN, contactsLastSeenDuration: users))
	}
}
