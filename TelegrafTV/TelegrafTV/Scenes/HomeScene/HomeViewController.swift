//
//  HomeViewController.swift
//  TelegrafTV
//
//  Created by O on 7/14/18.
//  Copyright © 2018 Pedja Jevtic. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate {
    
    var liveImage = ["LukaModric"]
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 7
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.homeView.collectionView.dequeueReusableCell(withReuseIdentifier: "cellIdentifier", for: indexPath) as! LiveCollectionViewCell
   
        
        //cell.liveImage.image = UIImage(named: liveImage[indexPath.row])
        return cell
        
    }
    

    @IBOutlet var homeView: HomeView!
  
    
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        self.homeView.collectionView?.backgroundColor = UIColor.blue
        
        self.homeView.collectionView?.register(LiveCollectionViewCell.self, forCellWithReuseIdentifier: "cellIdentifier")
        
        self.homeView.collectionView.delegate = self
        self.homeView.collectionView.dataSource = self
       homeView.updateUI()

        self.loadVideoNavigation()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    // Call to API for retrieving data

    func loadVideoNavigation() {
        let apiManager = TFApiClient()

        do {
            let request = try TFRequest.init(path: .navigation)

            apiManager.fetch(request: request, completion: { (result) in

                switch result {
                case .success(let data):
                        print("Success:", data)
                        
                    break
                case .errorWithDictionary(let responseObj):
                    print("Error:", responseObj)
                    break

                case .error(let message):
                    print("error: \(message)")
                    break
                }
            })

        } catch let error {
            print("Error \(error.localizedDescription)")
        }
    }

}
