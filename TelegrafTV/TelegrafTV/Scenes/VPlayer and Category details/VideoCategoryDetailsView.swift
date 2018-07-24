//
//  VideoCategoryDetailsView.swift
//  TelegrafTV
//
//  Created by Nebojsa Krstovic on 7/22/18.
//  Copyright © 2018 Pedja Jevtic. All rights reserved.
//

import UIKit

class VideoCategoryDetailsView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet var videoCategoryDetailsView: UIView!
    @IBOutlet weak var videoCollectionView: UICollectionView!
    
    let MyCollectionViewCellId: String = "MyCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let nibCell = UINib(nibName: MyCollectionViewCellId, bundle: nil)
        videoCollectionView.register(nibCell, forCellWithReuseIdentifier: MyCollectionViewCellId)
        
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
        Bundle.main.loadNibNamed("VideoCategoryDetailsView", owner: self, options: nil)
        addSubview(videoCategoryDetailsView)
        videoCategoryDetailsView.frame = self.bounds
        videoCategoryDetailsView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
    }
    
    func updateUI() {
        
        self.videoCategoryDetailsView.backgroundColor = .clear
        self.videoCollectionView.backgroundColor = .clear
    }
    
    func numberOfSections(in videoCollectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ videoCollectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ videoCollectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset = 40
        return UIEdgeInsetsMake(CGFloat(inset), CGFloat(inset), CGFloat(inset), CGFloat(inset))
    }
    
    func collectionView(_ videoCollectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        let minimumInserSpacing = 50
        
        return CGFloat (minimumInserSpacing)
    }
    func collectionView(_ videoCollectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 308 , height: 308)
    }

    func collectionView(_ videoCollectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = videoCollectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCellId, for: indexPath) as! MyCollectionViewCell
        //        let category = self.categorys[indexPath.row]
        
        cell.dateLbl.text = "28.Februar.2018"
        cell.timeLbl.text = "5:40"
        cell.titleLbl.text = "NOLE DRHTAVIM GLASOM pred srpskim novinarima rekao ono ČEGA SE SVI PLAŠE: Ne mogu više ovako, od danas do sutra!"
        
        cell.itemImage.image = UIImage.init(named: "img1")
        
        return cell
    }
    
}
