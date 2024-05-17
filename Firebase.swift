//
//  Firebase.swift
//  FishingBuddyNew
//
//  Created by Jeel Zalavadiya on 21/02/24.
//

import Foundation
import UIKit
import FirebaseFirestore
import FirebaseAuth

func setUserData (name: String, email: String , password: String , id: String) {
    
    let db = Firestore.firestore()
    let collection = db.collection("UserInfo")
    collection.document(email).setData([
        
        "id" : id,
        "name": name,
        "email": email,
        "password": password
        
    ])
}

struct FireBase_Model {
    
    var name = ""
    var email = ""
    var id = ""
    
    init(dic: [String : Any]) {
        self.name = dic["name"] as? String ?? ""
        self.email = dic["email"] as? String ?? ""
        self.id = dic["id"] as? String ?? ""
    }
}

func setUserMessage (senderId: String , message: String , receiverId: String , realtime : Timestamp) {
    
    let db = Firestore.firestore()
    
    let collection = db.collection("UserMessages")
    collection.document().setData([

        "message": message,
        currentUserUID : senderId,
        "sender": senderId,
        "receiver": receiverId,
        receiverId : receiverId,
        "realtime": realtime
    ])
}

struct userMessage {
    
    var message = ""
    var senderId = ""
    var receiverId = ""
    var realtime = ""
    init(dic: [String:Any]) {
        self.message = dic["message"] as? String ?? ""
        self.senderId = dic["sender"] as? String ?? ""
        self.receiverId = dic["receiver"] as? String ?? ""
        self.realtime = dic["realtime"] as? String ?? ""
    }
    
}
