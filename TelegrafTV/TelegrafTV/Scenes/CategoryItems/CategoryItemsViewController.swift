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
        print(category ?? "nothing to show")
        
       self.loadVideos()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // Call API for category videos
    func loadVideos(){
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


//                         let pageItems = Pages.parseData(data)
//                         self.categoryItemsView.updatePage(pages: pageItems)

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
   
    

    

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        switch segue.identifier {
//        case "openHomeView":
//            print("home section")
//
//        default:
//
//            guard let navController = segue.destination as? UINavigationController else { return }
//            guard let categoryItemsView = navController.view as? CategoryItemsView else { return }
//            guard let category = sender as? CategoryList else { return }
//
//            categoryItemsView.category = category
//
//        }
//    }
    
}


