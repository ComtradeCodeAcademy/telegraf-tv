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
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
     categoryTableView.reloadData()
//    tableView.layer.borderWidth = 5.0
    tableView.backgroundColor = .black
//    tableView.layer.borderColor = UIColor.red.cgColor
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 6
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell") as! MenuTableViewCell
        switch indexPath.row{
        case 0:
        cell.textLabel?.text =  "UŽIVO"
        cell.textLabel?.font = UIFont(name: "Avenir-Light-Bold", size: 10)
        cell.textLabel?.textColor = .white
        cell.textLabel?.textAlignment = .left
        
        case 1:
        cell.textLabel?.text =  "VESTI"
        cell.textLabel?.font = UIFont(name: "Avenir-Light-Bold", size: 10)
        cell.textLabel?.textColor = .white
        cell.textLabel?.textAlignment = .left
        case 2:
        cell.textLabel?.text =  "JETSET"
        cell.textLabel?.font = UIFont(name: "Avenir-Light-Bold", size: 10)
        cell.textLabel?.textColor = .white
        cell.textLabel?.textAlignment = .left
        case 3:
        cell.textLabel?.text =  "HI-TECH"
        cell.textLabel?.font = UIFont(name: "Avenir-Light-Bold", size: 10)
        cell.textLabel?.textColor = .white
        cell.textLabel?.textAlignment = .left
        case 4:
        cell.textLabel?.text =  "ZANIMLJIVOSTI"
        cell.textLabel?.font = UIFont(name: "Avenir-Light-Bold", size: 10)
        cell.textLabel?.textColor = .white
             cell.textLabel?.textAlignment = .left
        default:
        cell.textLabel?.text =  "ŽIVOT & STIL"
        cell.textLabel?.font = UIFont(name: "Avenir-Light-Bold", size: 10)
        cell.textLabel?.textColor = .white
        cell.textLabel?.textAlignment = .left
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
    }

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 130
            
        default:
            return 130
        }
       
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
}
