//
//  HomeView.swift
//  TelegrafTV
//
//  Created by O on 7/14/18.
//  Copyright © 2018 Pedja Jevtic. All rights reserved.
//

import UIKit
import Foundation

class HomeView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    

    @IBOutlet var homeView: UIView!
    @IBOutlet weak var homeCollectionView: UICollectionView!
    let liveCellID: String = "LiveCollectionViewCell"
    let MyCollectionViewCellId: String = "MyCollectionViewCell"
    let MyColectionViewHeaderId: String = "MyCollectionReusableView"
    
    var categories = [CategoryList?]()
    var categoryVideosController: HomeViewController?
    var homeVideos = [VideoItem?]()
    var categoryData = [String: [VideoItem]]()
    
    // MARK: Register UI CV item cell and SectionHeader
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let nibCellLive = UINib(nibName: liveCellID, bundle: nil)
        homeCollectionView.register(nibCellLive, forCellWithReuseIdentifier: liveCellID)
        let nibCell = UINib(nibName: MyCollectionViewCellId, bundle: nil)
        homeCollectionView.register(nibCell, forCellWithReuseIdentifier: MyCollectionViewCellId)
        let nibHeader = UINib(nibName: MyColectionViewHeaderId, bundle: nil)
        homeCollectionView.register(nibHeader, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: MyColectionViewHeaderId)
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
            let category = self.categories[section]
            if let categoryVideos = self.categoryData[(category?.name)!] {
                if categoryVideos.count > 0 {
                    if categoryVideos.count >= 3 {
                        return 3
                    }
                }
                return categoryVideos.count
            }
            
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        DispatchQueue.global().async {
            let lastItem = self.homeVideos.count
            if indexPath.row == lastItem {
                
                //                self.categoryVideosController?.loadVideos()
            }
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
        switch indexPath.section {
        case 0:
            return CGSize.init(width: 600, height: 350)
        default:
            return CGSize.init(width: 308, height: 308)
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LiveCollectionViewCell", for: indexPath) as? LiveCollectionViewCell
//            let category = self.categories[indexPath.section]
//            if let videoItems = categoryData[(category?.name)!] {
//                let videoItem = videoItems[indexPath.row]
//                cell.configureCell(videos: videoItem)
//            }
           
            cell?.configureCell()
            return  cell!
        default:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCellId, for: indexPath) as? MyCollectionViewCell
            
            let category = self.categories[indexPath.section]
            if let videoItems = categoryData[(category?.name)!] {
                let videoItem = videoItems[indexPath.row]
                cell?.setCollectionViewCellWith(videos: videoItem)
            }
            return cell!
        }
    }
    
    
    // MARK: Section Header
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let sectionHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "MyCollectionReusableView", for: indexPath as IndexPath) as? MyCollectionReusableView
        
        let category = self.categories[indexPath.section]
        
        print(categoryData)
        
        sectionHeaderView?.headerLbl.text = "test"
        sectionHeaderView?.frame.size.height = 60
        //        sectionHeaderView.headerLbl.text = self.categories[indexPath.section]
        sectionHeaderView?.headerLbl.text = category?.name
        sectionHeaderView?.headerLbl.font = UIFont(name: "SFFrancisco-Bold", size: 60)
        sectionHeaderView?.headerLbl.textColor = .white
        
        return sectionHeaderView!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize.init(width: self.homeView.frame.size.width, height: 60)
    }
    
    func updateUI(categories: [CategoryList], categoryData: [String: [VideoItem]]) {
        self.categories = categories
        self.categoryData = categoryData
        self.homeView.backgroundColor = .clear
        self.homeCollectionView.backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.extraDark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = homeView.bounds
        homeView.addSubview(blurEffectView)
        homeView.sendSubview(toBack: blurEffectView)
        self.homeCollectionView.reloadData()
    }
    
    func updateVideos(videos: [VideoItem], forCategory: String) {
        print(videos)

    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if let videoItems = homeVideos as? [VideoItem] {
//            let videoItem = videoItems[indexPath.row]
//            self.categoryVideosController?.performSegue(withIdentifier: "showHomeVideo", sender: videoItem)
//        }
//        
//    }
    
}
