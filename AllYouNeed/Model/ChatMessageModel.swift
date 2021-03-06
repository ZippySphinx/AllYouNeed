//
//  ChatMessageModel.swift
//  AllYouNeed
//
//  Created by Shubham Kumar on 12/02/22.
//

import Foundation

import Firebase

struct ChatMessageModel: Codable, Equatable, Hashable {
    
    let fromId, messageId, timestamp, toId, text: String
    let time: Int
    var imageUrl: String?
    var fileUrl: String?
    var fileType: String?

    enum CodingKeys: String, CodingKey {
        case fromId, text, time, timestamp, toId, imageUrl
        case messageId = "id"
    }
    
    init() {
        self.fromId = ""
        self.messageId = ""
        self.text = ""
        self.time = 0
        self.timestamp = ""
        self.toId = ""
    }
    
    init(_ fromId: String, _ messageId: String, _ text: String, _ time: Int, _ timestamp: String, _ toId: String) {
        self.fromId = fromId
        self.messageId = messageId
        self.text = text
        self.time = time
        self.timestamp = timestamp
        self.toId = toId
    }
    
    init(_ fromId: String, _ messageId: String, _ text: String, _ time: Int, _ timestamp: String, _ toId: String, _ imageUrl: String) {
        self.fromId = fromId
        self.messageId = messageId
        self.text = text
        self.time = time
        self.timestamp = timestamp
        self.toId = toId
        self.imageUrl = imageUrl
    }
    
    init(_ fromId: String, _ messageId: String, _ text: String, _ time: Int, _ timestamp: String, _ toId: String, _ fileUrl: String, _ fileType: String?) {
        self.fromId = fromId
        self.messageId = messageId
        self.text = text
        self.time = time
        self.timestamp = timestamp
        self.toId = toId
        self.fileUrl = fileUrl
        self.fileType = fileType
    }
    
    func toAnyObject() -> Any {
        if imageUrl != nil {
            return [
                "fromId" : fromId,
                "id" : id,
                "text" : text,
                "time" : time,
                "timestamp" : timestamp,
                "toId" : toId,
                "imageUrl" : imageUrl!
            ]
        } else if fileUrl != nil {
            return [
                "fromId" : fromId,
                "id" : id,
                "text" : text,
                "time" : time,
                "timestamp" : timestamp,
                "toId" : toId,
                "fileUrl" : fileUrl!,
                "fileType" : fileType!
            ]
        } else {
            return [
                "fromId" : fromId,
                "id" : id,
                "text" : text,
                "time" : time,
                "timestamp" : timestamp,
                "toId" : toId
            ]
        }
    }
}

extension ChatMessageModel: Identifiable {
    var id: String { return messageId }
}
