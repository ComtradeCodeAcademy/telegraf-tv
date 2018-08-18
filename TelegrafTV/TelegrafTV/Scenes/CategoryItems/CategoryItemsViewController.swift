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
  


    override func viewDidLoad() {
        super.viewDidLoad()
    
        categoryItemsView.updateUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(category ?? "nothing to show")
        
       self.loadVideos(page: 1, url: category?.url)
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // Call API for category videos
    func loadVideos(page: Int, url: String?){
        let myPage = page
        let myURl = url
        let apiManager = TFApiClient()

        do {
            let request = try TFRequest.init(url: myURl!, page: myPage)

            apiManager.fetch(request: request, completion: { (result) in

                switch result {

                case .success(let data):
                    print("Success:", data)
                         let videoItems = VideoItems.parseData(data)
                         self.categoryItemsView.updateVideos(videos: videoItems)

//                         self.collectionView.reloadItems(at: [forIndex])

//                         var newData = data
//                         videoItems.append(newData)

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


