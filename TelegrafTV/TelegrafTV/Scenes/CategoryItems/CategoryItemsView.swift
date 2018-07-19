//
//  CategoryItemsView.swift
//  TelegrafTV
//
//  Created by O on 7/14/18.
//  Copyright © 2018 Pedja Jevtic. All rights reserved.
//

import UIKit

class CategoryItemsView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {

    @IBOutlet var categoryItemsView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
     let MyCollectionViewCellId: String = "MyCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let nibCell = UINib(nibName: MyCollectionViewCellId, bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: MyCollectionViewCellId)
    }
    override init(frame:CGRect) {
        super.init(frame: frame)
        commonInit()
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    
   func commonInit() {
    Bundle.main.loadNibNamed("CategoryItemsView", owner: self, options: nil)
    addSubview(categoryItemsView)
    categoryItemsView.frame = self.bounds
    categoryItemsView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    
    }
    
    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 30
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        insetForSectionAt section: Int) -> UIEdgeInsets {
//        let inset = 100
//        return UIEdgeInsetsMake(CGFloat(inset), CGFloat(inset), CGFloat(inset), CGFloat(inset))
//    }
//
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize.init(width: 240 , height: 240)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCellId, for: indexPath) as! MyCollectionViewCell
//
//        cell.dateLbl.text = "28.februar.2018"
//        cell.timeLbl.text = "5:40"
//        cell.titleLbl.text = "Grupa IOS programera iz Comtrade postigla uspeh"
//
//        return cell
//    }
//
//    func updateUI() {
//
//        self.categoryItemsView.backgroundColor = .blue
//        self.collectionView.backgroundColor = .yellow
//
        //MARK: Registar UI CV item cell
        
      
        
        
    }
    
}
