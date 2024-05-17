//
//  ItemInfoVC.swift
//  FishingBuddy
//
//  Created by Jeel Zalavadiya on 14/02/24.
//

import UIKit

class ItemInfoVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var img_Item: UIImageView!
    
    @IBOutlet weak var collView_Suggetions: UICollectionView!
    
    @IBOutlet weak var btn_Back: UIButton!
    
    @IBOutlet weak var btn_Subscribe: UIButton!
    
    @IBOutlet weak var btn_chat: UIButton!
    
    @IBOutlet weak var btn_call: UIButton!
    var itemImage = UIImage()
    
    var shop_img = ["S1","S2","S3","S4","S5","S1"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btn_Back.cornerradiusBtn()
        self.btn_Subscribe.cornerradiusBtn()
        self.btn_chat.cornerradiusBtn()
        self.btn_chat.setgradiantcolor(color: [UIColor.color1,UIColor.color2], startpoint: CGPoint(x: 1.0, y: 0.0), endpoint: CGPoint(x: 0.0, y: 1.0), cornerradius: 8)
        self.btn_call.cornerradiusBtn()
        self.btn_call.setgradiantcolor(color: [UIColor.color1,UIColor.color2], startpoint: CGPoint(x: 1.0, y: 0.0), endpoint: CGPoint(x: 0.0, y: 1.0), cornerradius: 8)
        
        collView_Suggetions.delegate = self
        collView_Suggetions.dataSource = self
        collView_Suggetions.register(UINib(nibName: "TackleBox_CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TackleBox_CollectionViewCell")
        
        self.img_Item.image = itemImage
    }
    
    @IBAction func btn_Action_Back(_ sender: Any) {
        popVC(vc: self)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shop_img.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TackleBox_CollectionViewCell", for: indexPath) as!TackleBox_CollectionViewCell
        
        cell.img_shop.image = UIImage(named: shop_img[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 165, height: 205)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Shop", bundle: nil).instantiateViewController(withIdentifier: "ItemInfoVC") as! ItemInfoVC
        vc.itemImage = UIImage(named: shop_img[indexPath.row])!
        
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
   

}
