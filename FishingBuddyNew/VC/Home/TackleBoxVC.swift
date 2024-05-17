//
//  TackleBoxVC.swift
//  FishingBuddy
//
//  Created by Jeel Zalavadiya on 14/02/24.
//

import UIKit

class TackleBoxVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var collView_TackleBox: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        collView_TackleBox.dataSource = self
        collView_TackleBox.delegate = self
        collView_TackleBox.register(UINib(nibName: "TackleBox2_CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TackleBox2_CollectionViewCell")
    }
    
    @IBAction func btn_Action_Back(_ sender: Any) {
        
        popVC(vc: self)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 108, height: 126)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TackleBox2_CollectionViewCell", for: indexPath) as! TackleBox2_CollectionViewCell
        
        return cell
    }
    
    
    
    
    

}
