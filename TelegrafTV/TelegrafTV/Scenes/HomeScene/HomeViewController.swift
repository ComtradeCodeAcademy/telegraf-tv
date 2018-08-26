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
            if let videosForCategory = categoryData[(category.name)!] as? [VideoItem] {
                
            }else{
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
    
    func loadVideos(forURL: String, forCategory: String){

        let apiManager = TFApiClient()

        do {
            let request = try TFRequest.init(url: forURL, page: self.page)

            apiManager.fetch(request: request, completion: { (result) in

                switch result {

                case .success(let data):
                    print("Success:", data)
                    let videoItems = VideoItems.parseData(data)
                    self.categoryData[forCategory] = videoItems
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
}



