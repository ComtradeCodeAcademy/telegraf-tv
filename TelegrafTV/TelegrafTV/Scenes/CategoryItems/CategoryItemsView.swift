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
     let MyCollectionViewHeaderId: String = "MyCollectionViewHeader"
    
//    let baseURL = "http://tv.tf.rs/"
//    var categorys = [[String: AnyObject]]()
    
    //MARK: Registar UI CV item cell and SectionHeader
    override func awakeFromNib() {
        super.awakeFromNib()
        let nibCell = UINib(nibName: MyCollectionViewCellId, bundle: nil)
        let nibHeader = UINib(nibName: MyCollectionViewHeaderId, bundle: nil)
        
        collectionView.register(nibCell, forCellWithReuseIdentifier: MyCollectionViewCellId)
        collectionView.register(nibHeader, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: MyCollectionViewHeaderId)
        

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
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCellId, for: indexPath) as! MyCollectionViewCell
//        let category = self.categorys[indexPath.row]
        
        cell.dateLbl.text = "28.Februar.2018"
        cell.timeLbl.text = "5:40"
        cell.titleLbl.text = "NOLE DRHTAVIM GLASOM pred srpskim novinarima rekao ono ČEGA SE SVI PLAŠE: Ne mogu više ovako, od danas do sutra!"
        
        cell.itemImage.image = UIImage.init(named: "img1")

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: MyCollectionViewHeaderId, for: indexPath as IndexPath) as! SectionHeaderCollectionReusableView
     
        
        header.headerLbl.text =  "SPORT"

        return header
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {

     return CGSize.init(width: 120 , height: 60)
    }

    func updateUI() {

        self.categoryItemsView.backgroundColor = .gray
        self.collectionView.backgroundColor = .clear
        
    }
//    func loadApi() {
//
//        guard let url = URL.init(string: baseURL) else { return }
//
//        let urlRequest = URLRequest.init(url: url)
//
//        let task = URLSession.shared.dataTask(with: urlRequest) {(data, response, error) in
//            if let usableData = data {
//                do {
//
//
//                    if let jsonData = try JSONSerialization.jsonObject(with: usableData, options: JSONSerialization.ReadingOptions.allowFragments) as? [[String: AnyObject]] {
//
//                        DispatchQueue.main.async {
//                            self.categorys = jsonData
//                            self.collectionView.reloadData()
//
//                        }
//                    }
//                } catch let myJSONError {
//                    print(myJSONError)
//                }
//            }
//
//        }
//        task.resume()
//    }
    

}
