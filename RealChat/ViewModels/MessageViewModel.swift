//
//  MessageViewModel.swift
//  RealChat
//
//  Created by Elbert Rivas on 11/11/2019.
//  Copyright © 2019 Elbert. All rights reserved.
//

import FirebaseAuth
import FirebaseDatabase

class MessageViewModel {
    
    let auth = Auth.auth()
    
    var chatRoomId: String?
    var ref: DatabaseReference!
    var chatPath: DatabaseReference!
    var hasListener: Bool = false
    var chatMessageHandle: UInt?
    
    var isChatToOne = true
    
    var chatMessage: ChatMessage? {
        didSet {
            sendMessage()
        }
    }
    
    var message: ChatMessage? {
        didSet {
            self.reloadTableViewClosure!(message!)
        }
    }
    
    init() {
        ref = Database.database().reference()
        
        // db paths
        chatPath = ref.child("chats")
    }
    
    var sendMessageClosure: (() -> ())?
    var reloadTableViewClosure: ((ChatMessage) -> ())?
    
    func getUserId() -> String? {
        return auth.currentUser?.uid ?? ""
    }
    
    func openMessage(isChatToOne: Bool) {
        if !self.hasListener {
            if chatRoomId != nil {
                self.getMessageByChatroomId(chatroomId: self.chatRoomId!) { (hasListener) in
                    self.hasListener = hasListener
                }
            } else {
                self.chatPath.child("members").queryOrdered(byChild: getUserId()!).queryEqual(toValue: true).observeSingleEvent(of: .value) { (snapshot) in
                    if !snapshot.exists() { return }
                    
                    let enumerator = snapshot.children
                    
                    while let result = enumerator.nextObject() as? DataSnapshot {
                        if isChatToOne {
                            if result.hasChild("chatToOne") {
                                let chatroomId = result.key
    
                                self.getMessageByChatroomId(chatroomId: chatroomId) { (hasListener) in
                                    self.hasListener = hasListener
                                }
                            }
                        } else {
                            if result.hasChild("chatToMany") {
                                let chatroomId = result.key
                                
                                self.getMessageByChatroomId(chatroomId: chatroomId) { (hasListener) in
                                    self.hasListener = hasListener
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    private func getMessageByChatroomId(chatroomId: String, completion: @escaping(Bool) -> Void) {
        self.chatRoomId = chatroomId
        
        self.chatMessageHandle = self.chatPath.child("messages").child(chatroomId).observe(.childAdded) { (snapshot) in
            if !snapshot.exists() { return }
            
            let result = snapshot.value as? [String: Any]
            var chatMessage = ChatMessage()
            
            chatMessage.message = result?["message"] as? String
            chatMessage.name = result?["name"] as? String
            chatMessage.photoUrl = result?["photoUrl"] as? String
            chatMessage.userId = result?["userId"] as? String
            chatMessage.timestampDouble = result?["timestamp"] as? Double
            
            self.message = chatMessage
            
            completion(true)
        }
    }
    
    private func sendMessage() {
        var members: Dictionary = [String: Bool]()
        let myId = getUserId()
        
        if self.isChatToOne {
            members[myId!] = true
            members[Constants.chatmateJohnId] = true
            members["chatToOne"] = true
        } else {
            members[myId!] = true
            members[Constants.chatmateJohnId] = true
            members[Constants.chatmateJayId] = true
            members["chatToMany"] = true
        }
        
    
        if chatRoomId == nil {
            chatRoomId = self.chatPath.child("members").childByAutoId().key
        }
        
        self.chatPath.child("members").child(chatRoomId!).setValue(members) { (error: Error?, ref: DatabaseReference) in
            if error != nil {
                return
            }
        }
        
//        let chatmateLastMessage = LastMessage(chatroomId: chatRoomId, chatmateId: myId!, name: self.chatMessage?.name, photoUrl: self.chatMessage?.photoUrl, message: self.chatMessage?.message, isRead: false)
        
//        self.chatPath.child("lastMessage").child(Constants.chatmateId).setValue(chatmateLastMessage.convertToDictionary()) { (error, ref) in
//            if error != nil {
//                return
//            }
//        }
        self.chatPath.child("messages").child(chatRoomId!).childByAutoId().setValue(self.chatMessage?.convertToDictionary()) { (error, ref) in
            if error != nil {
                return
            } else {
                print("message sent")
                //self.sendMessageClosure!()
            }
        }
    }
    
    func removeListener() {
        guard self.chatMessageHandle != nil else { return }
        
        if chatRoomId != nil {
            self.chatPath.child("messages").child(self.chatRoomId!).removeAllObservers()
            self.chatRoomId = nil
        }
        
        self.hasListener = false
    }
}


