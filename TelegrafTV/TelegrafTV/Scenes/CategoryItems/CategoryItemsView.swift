//
//  CategoryItemsView.swift
//  TelegrafTV
//
//  Created by O on 7/14/18.
//  Copyright © 2018 Pedja Jevtic. All rights reserved.
//

import UIKit
import Foundation

class CategoryItemsView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
   
    @IBOutlet var categoryItemsView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!

    @IBOutlet weak var headerTitle: UILabel!
//     var category: CategoryList?
//    var tasks = [URLSessionDataTask?](repeating:nil, count: 10)
    var videos = [VideoItem]()
    var categoryData = [CategoryList?]()
//    var pages = [Page]()
    
    var page = 1
    var isPageRefreshing:Bool = false
    
    let MyCollectionViewCellId: String = "MyCollectionViewCell"
    let MyColectionViewHeaderId: String = "MyCollectionReusableView"
    
   
    //MARK: Registar UI CV item cell and SectionHeader
    override func awakeFromNib() {
        super.awakeFromNib()
        let nibCell = UINib(nibName: MyCollectionViewCellId, bundle: nil)
        let nibHeader = UINib(nibName: MyColectionViewHeaderId, bundle: nil)
        
        collectionView.register(nibCell, forCellWithReuseIdentifier: MyCollectionViewCellId)
        collectionView.register(nibHeader, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: MyColectionViewHeaderId)
   

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
 
        return self.videos.count
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

       let videoItem = self.videos[indexPath.row]
     
            cell.dateLbl.text = videoItem.date
            cell.timeLbl.text = videoItem.duration
            cell.titleLbl.text = videoItem.title
            cell.itemImage.loadImageUsingCacheWithURLString(videoItem.imageURL!, placeHolder: UIImage(named: "placeholder"))
        
        return cell
    }
    
       func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        DispatchQueue.global().async {
            let lastItem = self.videos.count - 1
            if indexPath.row == lastItem {
                self.page += 1
          print(self.page)
                let category = self.categoryData[indexPath.row]
                let getData = CategoryItemsViewController()
                getData.loadVideos(page: self.page, url: category?.url)
                for item in self.videos {
                    let newData = item
                    self.videos.append(newData)
                }
            }
        }
        
    }
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if(self.collectionView.contentOffset.y >= (self.collectionView.contentSize.height - self.collectionView.bounds.size.height)) {
//            if(isPageRefreshing==false) {
//                isPageRefreshing=true
//                print(page)
//                page += 1
//                let getData = CategoryItemsViewController()
//                getData.loadVideos(page: page)
//
//            }
//        }
    

    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "MyCollectionReusableView", for: indexPath as IndexPath) as! MyCollectionReusableView

             headerView.frame.size.height = 60


        DispatchQueue.main.async {
//            if let headerTitle = self.categoryData[indexPath.row] {
//            headerView.headerLbl.text = headerTitle.name
//            }
            headerView.headerLbl.text = "HI-tech"
            headerView.headerLbl.font = UIFont(name: "SFFrancisco-Bold", size: 60)
            headerView.headerLbl.textColor = .white

        }


        return headerView
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {


     return CGSize.init(width: 120 , height: 60)
    }

    func updateUI() {

        self.categoryItemsView.backgroundColor = .gray
        self.collectionView.backgroundColor = .clear
        
        
    }
        func updateVideos(videos: [VideoItem]) {
            print(videos)
            self.videos = videos
            self.collectionView.reloadData()
}
    func updateCategoryData(category: [CategoryList]) {
        print(category)
        self.categoryData = category
        
    }
}
//    func updatePage(pages:[Page]){
//    print(pages)
//        self.pages = pages
//        self.collectionView.reloadData()
//    }

//    func loadMoreData() -> [IndexPath] {
//        var paths = [IndexPath]()
//        for i in videos {
//            self.videos.append(i)
//            paths.append(IndexPath(row: self.videos.count - 1, section: 1))
//        }
//        return paths
//    }
////    func insertMore() {
//        DispatchQueue.global().async {
//            let paths = self.loadMoreData()
//            OperationQueue.main.addOperation {
//                collectionView.performBatchUpdates({ () -> Void in
//
//                }, completion:nil)
//
//            }
//        }
//    }


//    func requestData(forIndex: IndexPath) {
//        var task: URLSessionDataTask
//
//        if self.videos[forIndex.row] != nil {
//            // Video is already loaded
//            return
//        }
//
//        if tasks[forIndex.row] != nil
//            && tasks[forIndex.row]!.state == URLSessionTask.State.running {
//            // Wait for task to finish
//            return
//        }
//        let getData = CategoryItemsViewController()
//        getData.loadVideos()
//        task = self.tasks[forIndex.row]!
//        task.resume()
//    }

