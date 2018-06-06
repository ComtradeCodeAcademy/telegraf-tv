//
//  ViewController.swift
//  TelegrafTV
//
//  Created by Pedja Jevtic on 6/6/18.
//  Copyright © 2018 Pedja Jevtic. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var featuredVideos = [String]()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        featuredVideos = ["WWDC in Serbia"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension HomeViewController: UICollectionViewDelegate {
    
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return featuredVideos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cells.featuredVideo.rawValue, for: indexPath) as! FeaturedVideoCollectionViewCell
        
        let featuredVideo = featuredVideos[indexPath.row]
        
        cell.titleLbl.text = featuredVideo
        return cell
        
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 320, height: 220)
    }
}
