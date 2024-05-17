//
//  MyShopVC.swift
//  FishingBuddy
//
//  Created by Jeel Zalavadiya on 14/02/24.
//

import UIKit

class MyShopVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView_MyShop: UITableView!
    
    @IBOutlet weak var btn_Back: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView_MyShop.dataSource = self
        tableView_MyShop.delegate = self
        tableView_MyShop.register(UINib(nibName: "MyShop_TableViewCell", bundle: nil), forCellReuseIdentifier: "MyShop_TableViewCell")
        
        self.btn_Back.cornerradiusBtn()
    }
    
    
    @IBAction func btn_Action_Back(_ sender: Any) {
        popVC(vc: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyShop_TableViewCell") as! MyShop_TableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
   
}
