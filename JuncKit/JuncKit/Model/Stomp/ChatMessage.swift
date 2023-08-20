//
//  ChatMessage.swift
//  JuncKit
//
//  Created by 박의서 on 2023/08/20.
//

import Foundation

class ChatMessage {
    enum MessageType {
        case enter, talk
    }
    
    var type: MessageType
    var roomId: String
    var sender: String
    var message: String
    
    init(type: MessageType, roomId: String, sender: String, message: String) {
        self.type = type
        self.roomId = roomId
        self.sender = sender
        self.message = message
    }
}
