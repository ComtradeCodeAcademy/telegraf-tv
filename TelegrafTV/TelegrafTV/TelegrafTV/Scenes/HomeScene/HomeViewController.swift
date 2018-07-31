//
//  HomeViewController.swift
//  TelegrafTV
//
//  Created by O on 7/14/18.
//  Copyright © 2018 Pedja Jevtic. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var homeView: HomeView!
    override func viewDidLoad() {
        super.viewDidLoad()

       homeView.updateUI()

        HomeViewController.loadVideoNavigation()

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

   static func loadVideoNavigation() {
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
