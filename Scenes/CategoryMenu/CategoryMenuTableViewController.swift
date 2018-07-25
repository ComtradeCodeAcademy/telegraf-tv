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
        arrayDataCell = ["Uzivo", "Vesti","Sport"]
        
        categoryTableView.reloadData()
        
        tableView.layer.borderWidth = 5.0
        tableView.backgroundColor = .black
        tableView.layer.borderColor = UIColor.red.cgColor
        
        //tableView.sectionIndexColor = UIColor.clear
                
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
        
        if indexPath.row == 0{
            cell.isSelected = true
        }
        
        cell.titleLbl.text = arrayDataCell[indexPath.row]
        
        cell.selectionImg.image = UIImage.init(named: "selectionLine")
        
        if showImageIndex == indexPath.row {
            cell.selectionImg.isHidden = false
        }else{
            cell.selectionImg.isHidden = true
        }
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0 :
            self.performSegue(withIdentifier: "openHomeView", sender: self)
            
        default:
            self.performSegue(withIdentifier: "openCategoryItemsView", sender: self)
        }
        showImageIndex = indexPath.row
        self.categoryTableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 130
            
        default:
            return 130
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
        }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = Bundle.main.loadNibNamed("CategoryMenuHeader", owner: self, options: nil)?.first as! CategoryMenuHeader
        
    
        headerView.frame = CGRect(x:0, y:0, width: view.frame.width, height: 50)
        
        headerView.imgBack.image = UIImage.init(named: "telegrafLogo")
    
        
        
        
        
        return headerView
        
    }
    
    
    
}





