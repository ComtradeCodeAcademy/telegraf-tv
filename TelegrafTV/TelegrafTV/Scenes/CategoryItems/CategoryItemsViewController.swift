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
        categoryItemsView.categoryVideosController = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(category ?? "nothing to show")
        
       self.loadVideos()
       }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Call API for category videos
    func loadVideos() {
       guard let url = category?.url else { return }
        
        let apiManager = TFApiClient()

        do {
            let request = try TFRequest.init(url: url, page: self.page)

            apiManager.fetch(request: request, completion: { (result) in

                switch result {

                case .success(let data):
                    print("Success:", data)
                         let videoItems = VideoItems.parseData(data)
                         self.categoryItemsView.updateVideos(videos: videoItems)
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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showVideo" {
            let destinationVC = segue.destination as? VPlayerViewController
            if let videoItem = sender as? VideoItem {
                destinationVC?.videoItem = videoItem
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showVideo" {
            let destinationVC = segue.destination as! VPlayerViewController
            if let videoItem = sender as? VideoItem {
                destinationVC.videoItem = videoItem
            }
        }
    }
}
