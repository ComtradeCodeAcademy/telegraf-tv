//
//  HomeViewController.swift
//  TelegrafTV
//
//  Created by O on 7/14/18.
//  Copyright © 2018 Pedja Jevtic. All rights reserved.
//

import UIKit
import CoreData

class HomeViewController: UIViewController, NSFetchedResultsControllerDelegate {

    @IBOutlet var homeView: HomeView!
    

    var categories = [CategoryList]()
    var categoryData = [String: [VideoItem]]()
    var page = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeView.categoryVideosController = self
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        for category in self.categories {
            print(category)
            if categoryData[(category.name)!] != nil {
                
            }else {
                categoryData[(category.name)!] = [VideoItem]()
                self.loadVideos(forURL: category.url!, forCategory: category.name!)
            }
        }
        
        self.homeView.updateUI(categories: self.categories, categoryData: self.categoryData)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // Call API for category videos
    
    func loadVideos(forURL: String, forCategory: String) {

        let apiManager = TFApiClient()

        do {
            let request = try TFRequest.init(url: forURL, page: self.page)

            apiManager.fetch(request: request, completion: { (result) in

                switch result {

                case .success(let data):
                    print("Success:", data)
                    let videoItems = VideoItems.parseData(data)
                    self.categoryData[forCategory] = videoItems
                    self.homeView.updateVideos(videos: videoItems)
                    self.homeView.updateUI(categories: self.categories, categoryData: self.categoryData)
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
    
      // MARK: Send data from HomeVC to VideoPlayer
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showHomeVideo" {
            let destinationVC = segue.destination as? VPlayerViewController
            if let videoItem = sender as? VideoItem {
                destinationVC?.videoItem = videoItem
            }
        }
    }
}
