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
    override func viewDidLoad() {
        super.viewDidLoad()

     categoryItemsView.updateUI()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
