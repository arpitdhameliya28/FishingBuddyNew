//
//  PremiumFeaturesVC.swift
//  FishingBuddy
//
//  Created by Jeel Zalavadiya on 14/02/24.
//

import UIKit

class PremiumFeaturesVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView_PremiumFeatures: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView_PremiumFeatures.dataSource = self
        tableView_PremiumFeatures.delegate = self
        tableView_PremiumFeatures.register(UINib(nibName: "PremiumFeatures_TableViewCell", bundle: nil), forCellReuseIdentifier: "PremiumFeatures_TableViewCell")
    }
    
    @IBAction func btn_Action_Back(_ sender: Any) {
        popVC(vc: self)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PremiumFeatures_TableViewCell") as! PremiumFeatures_TableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
   

}
