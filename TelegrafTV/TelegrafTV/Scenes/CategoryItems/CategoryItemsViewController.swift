//
//  CategoryItemsViewController.swift
//  TelegrafTV
//
//  Created by O on 7/14/18.
//  Copyright © 2018 Pedja Jevtic. All rights reserved.
//

import UIKit

class CategoryItemsViewController: UIViewController {

    @IBOutlet var categoryItemsView: CategoryItemsView!
    
    var category: CategoryList?
    var page = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        categoryItemsView.updateUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        self.loadVideos()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // Call API for category videos
    private func loadVideos() {
        let apiManager = TFApiClient()
        
        do {
            let request = try TFRequest.init(url: (category?.url)!, page: self.page)
            
            apiManager.fetch(request: request, completion: { (result) in
                
                switch result {
                    
                case .success(let data):
                    print("Success:", data)
                   
                    DispatchQueue.main.async {
                        let videoItems = VideoItems.parseData(data)
                         self.categoryItemsView.updateVideos(videos: videoItems)
                        
                       

                    }
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

    // Update view title
    // Display recevied videos in view

    
}
