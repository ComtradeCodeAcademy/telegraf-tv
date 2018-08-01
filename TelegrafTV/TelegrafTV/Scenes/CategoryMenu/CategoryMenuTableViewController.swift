//
//  CategoryMenuTableViewController.swift
//  TelegrafTV
//
//  Created by O on 7/14/18.
//  Copyright © 2018 Pedja Jevtic. All rights reserved.
//

import UIKit

class CategoryMenuTableViewController: UITableViewController {
    
    @IBOutlet var categoryTableView: UITableView!
    
    var showImageIndex : Int?
    var arrayDataCell = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryTableView.register(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "menuCell")
        
        arrayDataCell = ["Uzivo", "Vesti","sport"]
        
        HomeViewController.loadVideoNavigation()
        
        categoryTableView.reloadData()
      
        tableView.backgroundColor = .black
      
        tableView.sectionIndexColor = UIColor.clear
        
        headerImage()
        
        //let service = TFApiClient()
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.categoryTableView.selectRow(at: IndexPath.init(row: 0, section: 0), animated: true, scrollPosition: .top)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayDataCell.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell") as! MenuTableViewCell
        
        cell.titleLbl.text = arrayDataCell[indexPath.row]
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        indexPath.row == 0 ? self.performSegue(withIdentifier: "openHomeView", sender: self) :  self.performSegue(withIdentifier: "openCategoryItemsView", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell") as! MenuTableViewCell
        cell.selectionImg.isHidden = true
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 130
            
        default:
            return 130
        }
    }
    
    func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
        
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
    func headerImage() {
        let frame = CGRectMake(0, 0, self.view.frame.size.width , 200)
        let headerImageView = UIImageView(frame: frame)
        let image: UIImage = UIImage(named: "telegrafLogo")!
        headerImageView.image = image
        categoryTableView.tableHeaderView = headerImageView
    }
}
