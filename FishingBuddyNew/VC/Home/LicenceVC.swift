//
//  LicenceVC.swift
//  FishingBuddy
//
//  Created by Jeel Zalavadiya on 14/02/24.
//

import UIKit

class LicenceVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet weak var tableView_Licence: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView_Licence.dataSource = self
        tableView_Licence.delegate = self
        tableView_Licence.register(UINib(nibName: "Licence_TableViewCell", bundle: nil), forCellReuseIdentifier: "Licence_TableViewCell")
    }
    
    
    @IBAction func btn_Action_Back(_ sender: Any) {
        popVC(vc: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Licence_TableViewCell") as! Licence_TableViewCell
        return cell
    }
    
}
