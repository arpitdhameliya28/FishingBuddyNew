//
//  ShopVC.swift
//  FishingBuddy
//
//  Created by Jeel Zalavadiya on 15/02/24.
//

import UIKit

class ShopVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout, GoToShop, BoatForRent, Items {
    func navigate_GoToShop() {
        navigation(StoryBoard: "Shop", identifier: "MyShopVC", VC: self)
    }
    func navigate_BoatForRent() {
        navigation(StoryBoard: "Shop", identifier: "RentVC", VC: self)
    }
    func navigate_items() {
        navigation(StoryBoard: "Shop", identifier: "ItemVC", VC: self)
    }
    
    @IBOutlet weak var collView_ItemFilter: UICollectionView!
    
    @IBOutlet weak var collView_Shop: UICollectionView!
    
    var shop_img = ["S1","S2","S3","S4","S5","S1"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collView_Shop.delegate = self
        collView_Shop.dataSource = self
        collView_Shop.register(UINib(nibName: "TackleBox_CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TackleBox_CollectionViewCell")
        collView_ItemFilter.register(UINib(nibName: "ItemFilter_Coll_Cell", bundle: nil), forCellWithReuseIdentifier: "ItemFilter_Coll_Cell")

    }
    @IBAction func btn_Action_Create(_ sender: Any) {
        
        let vc = UIStoryboard(name: "Alert", bundle: nil).instantiateViewController(withIdentifier: "PremiumAlertVC") as! PremiumAlertVC
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        vc.delegate_Gotoshop = self
        vc.delegate_BoatForRent = self
        vc.delegate_Items = self
        self.present(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TackleBox_CollectionViewCell", for: indexPath) as! TackleBox_CollectionViewCell
        cell.img_shop.image = UIImage(named: shop_img[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Shop", bundle: nil).instantiateViewController(withIdentifier: "ItemInfoVC") as! ItemInfoVC
        
        vc.itemImage = UIImage(named: shop_img[indexPath.row])!
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 165, height: 205)
    }
   
}
