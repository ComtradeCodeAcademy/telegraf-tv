//
//  HomeView.swift
//  TelegrafTV
//
//  Created by O on 7/14/18.
//  Copyright © 2018 Pedja Jevtic. All rights reserved.
//

import UIKit

class HomeView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    var categories = ["UŽIVO", "VESTI", "SPORT", "JET SET", "HI-TECH", "ZANIMLJIVOSTI"]
    let liveCellID: String = "liveCollectionViewCell"
    let MyCollectionViewCellId: String = "MyCollectionViewCell"
  
    
    
    @IBOutlet var homeView: UIView!
    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    //MARK: Registar UI CV item cell and SectionHeader
    override func awakeFromNib() {
        super.awakeFromNib()
        let nibCellLive = UINib(nibName: liveCellID, bundle: nil)
        homeCollectionView.register(nibCellLive, forCellWithReuseIdentifier: liveCellID)
        let nibCell = UINib(nibName: MyCollectionViewCellId, bundle: nil)
        homeCollectionView.register(nibCell, forCellWithReuseIdentifier: MyCollectionViewCellId)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    
    func commonInit() {
        Bundle.main.loadNibNamed("HomeView", owner: self, options: nil)
        addSubview(homeView)
        homeView.frame = self.bounds
        homeView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return 4
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset = 50
        return UIEdgeInsetsMake(CGFloat(inset), CGFloat(inset), CGFloat(inset), CGFloat(inset))
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        let minimumInserSpacing = 100
        
        return CGFloat (minimumInserSpacing)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 308 , height: 308)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "liveCollectionViewCell", for: indexPath) as! liveCollectionViewCell
            cell.configureCell()
            return  cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as! MyCollectionViewCell
            cell.dateLbl.text = "28.Februar.2018"
            cell.timeLbl.text = "5:40"
            cell.titleLbl.text = "NOLE DRHTAVIM GLASOM pred srpskim novinarima rekao ono ČEGA SE SVI PLAŠE: Ne mogu više ovako, od danas do sutra!"
            
            cell.itemImage.image = UIImage.init(named: "img1")
            return cell
        }
    }
    
    
   
    func updateUI() {
        
        self.homeView.backgroundColor = .gray
        
    }

}
