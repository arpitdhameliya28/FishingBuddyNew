//
//  ChatTypingVC.swift
//  FishingBuddy
//
//  Created by Jeel Zalavadiya on 15/02/24.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore


class ChatTypingVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView_ChatTyping: UITableView!
    @IBOutlet weak var img_ChatUSer: UIImageView!
    @IBOutlet weak var lbl_ChatUser: UILabel!
    @IBOutlet weak var btn_Back: UIButton!
    @IBOutlet weak var btn_Call: UIButton!
    @IBOutlet weak var txt_messagesTyping: UITextField!
    
    var username_ = ""
    var userprofile = UIImage()
    
    var messagesModel = [userMessage]()
    var model : userMessage!
    
    var receiverUID = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getUserMessage()
        scroll()
        
        self.btn_Back.cornerradiusBtn()
        self.btn_Call.cornerradiusBtn()
        RoundHeight(Object: img_ChatUSer)

        tableView_ChatTyping.dataSource = self
        tableView_ChatTyping.delegate = self
        tableView_ChatTyping.register(UINib(nibName: "ChatSender_TableViewCell", bundle: nil), forCellReuseIdentifier: "ChatSender_TableViewCell")
        tableView_ChatTyping.register(UINib(nibName: "ChatReceiver_TableViewCell", bundle: nil), forCellReuseIdentifier: "ChatReceiver_TableViewCell")
        
        self.img_ChatUSer.image = userprofile
        self.lbl_ChatUser.text = username_
        
    }
    
    @IBAction func btn_Action_back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btn_Action_Send(_ sender: Any) {
        
        guard let mess = self.txt_messagesTyping.text else{
            print("no")
            return
        }
        setUserMessage(senderId: currentUserUID, message: mess, receiverId: receiverUID, realtime: Timestamp())
        getUserMessage()
        self.tableView_ChatTyping.reloadData()
        self.txt_messagesTyping.text = ""
        scroll()
        
        
    }
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messagesModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let message = messagesModel[indexPath.row]
        if message.senderId == currentUserUID{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChatSender_TableViewCell") as! ChatSender_TableViewCell
            cell.lbl_SendMess.text = message.message
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChatReceiver_TableViewCell") as! ChatReceiver_TableViewCell
            cell.lbl_receiveMessage.text = message.message
            return cell
        }
    }
    
    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 200
//    }
    
    func getUserMessage(){
        
        let db = Firestore.firestore()
        let collection = db.collection("UserMessages")

        collection.whereField(currentUserUID, isEqualTo: currentUserUID).whereField(receiverUID, isEqualTo: receiverUID).addSnapshotListener { querysnapshot, error in
            
            if let err = error as? NSError {
                print(err.localizedDescription)
            }
            else {
                let data = querysnapshot?.documents
                print(data)
                self.messagesModel.removeAll()
                for arr in data! {
                    self.model = userMessage(dic: arr.data())
                    self.messagesModel.append(self.model)
                }
                print(self.messagesModel)
                self.tableView_ChatTyping.reloadData()
            }
        }
    }
    
    func scroll(){
        
        if messagesModel.isEmpty == false {
            DispatchQueue.main.async {
                let indexpath = IndexPath(row: self.messagesModel.count - 1, section: 0)
                self.tableView_ChatTyping.scrollToRow(at: indexpath, at: .bottom, animated: true)
            }
        }
        else {
            print("no chat")
        }
        
    }
   
    
}
