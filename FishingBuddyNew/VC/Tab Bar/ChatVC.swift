//
//  ChatVC.swift
//  FishingBuddy
//
//  Created by Jeel Zalavadiya on 15/02/24.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ChatVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView_Chat: UITableView!
    
    static var img = ["1","2","3","4","5","6","7","8","9","10"]
    
    static var username = ["Jeel","Arpit","Abhi","Yugansh","Dev","Sujal","Sujan","Yash","Parth","Esha"]
    
    var threadModel = [FireBase_Model]()
    var model : FireBase_Model!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView_Chat.dataSource = self
        tableView_Chat.delegate = self
        tableView_Chat.register(UINib(nibName: "ChatListing_TableViewCell", bundle: nil), forCellReuseIdentifier: "ChatListing_TableViewCell")
        
        let db = Firestore.firestore()
        let collection = db.collection("UserInfo")
        
        collection.whereField("email", notIn: [Auth.auth().currentUser?.email ?? ""]).getDocuments { querysnapshot, error in
    
            if let err = error as? NSError {
                print(err.localizedDescription)
            }
            else {
                
                let arr = querysnapshot?.documents
                for i in arr! {
                    self.model = FireBase_Model(dic: i.data())
                    self.threadModel.append(self.model)
                    
                }
                print(self.threadModel)
                self.tableView_Chat.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return threadModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatListing_TableViewCell", for: indexPath) as! ChatListing_TableViewCell
        cell.img_user.image = UIImage(named: ChatVC.img[indexPath.row])
        cell.lbl_username.text = threadModel[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var index = threadModel[indexPath.row]
        let vc = UIStoryboard(name: "Chat", bundle: nil).instantiateViewController(withIdentifier: "ChatTypingVC") as! ChatTypingVC
        vc.username_  = threadModel[indexPath.row].name
        vc.receiverUID = threadModel[indexPath.row].id
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
