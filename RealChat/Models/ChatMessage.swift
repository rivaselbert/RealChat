//
//  ChatMessage.swift
//  RealChat
//
//  Created by Elbert Rivas on 11/11/2019.
//  Copyright © 2019 Elbert. All rights reserved.
//

struct ChatMessage {
    var message: String?
    var name: String?
    var photoUrl: String?
    var userId: String?
    var timestamp: [String : Any]?
    var timestampDouble: Double?
    
    init() {
        
    }
    
    init(message: String, name: String, photoUrl: String, userId: String, timestamp: [String : Any]) {
        self.message = message
        self.name = name
        self.photoUrl = photoUrl
        self.userId = userId
        self.timestamp = timestamp
    }
    
    func convertToDictionary() -> Dictionary<String, Any> {
        return [
            "message": self.message!,
            "name": self.name!,
            "photoUrl": self.photoUrl!,
            "userId": self.userId!,
            "timestamp": self.timestamp!
        ]
    }
}

struct LastMessage {
    var chatroomId: String?
    var chatmateId: String?
    var name: String?
    var photoUrl: String?
    var message: String?
    var isRead: Bool?
    
    func convertToDictionary() -> Dictionary<String, Any> {
        return [
            "chatRoomId": self.chatroomId!,
            "chatmateId": self.chatmateId!,
            "name": self.name!,
            "photoUrl": self.photoUrl!,
            "message": self.message!,
            "isRead": self.isRead!
        ]
    }
}
