//
//  CategoryMenuTableViewController.swift
//  TelegrafTV
//
//  Created by O on 7/14/18.
//  Copyright © 2018 Pedja Jevtic. All rights reserved.
//

import UIKit
import CoreData

class CategoryMenuTableViewController: UITableViewController {
    
    @IBOutlet var categoryTableView: UITableView!
    
    var showImageIndex : Int?
    var arrayDataCell = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryTableView.register(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "menuCell")
        
        arrayDataCell = ["Uzivo", "Vesti","sport"]
        
        loadVideoNavigation()
       
      
        categoryTableView.reloadData()
      
        tableView.backgroundColor = .black
      
        tableView.sectionIndexColor = UIColor.clear
        
        headerImage()
        
       
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.categoryTableView.selectRow(at: IndexPath.init(row: 0, section: 0), animated: true, scrollPosition: .top)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    // MARK: - NSFetchResultController
    
    lazy var fetchedhResultController: NSFetchedResultsController<NSFetchRequestResult> = {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: CategoryList.self))
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        let frc = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.sharedInstance.persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        // frc.delegate = self
        return frc
    }()
    
    // MARK: - Create CategoryList Entity
    
   private func createCategoryListEntityFrom(categorys: [String: AnyObject]) -> NSObject?  {
        let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
        if let categoryListEntity = NSEntityDescription.insertNewObject(forEntityName: "CategoryList", into: context) as? CategoryList {
            categoryListEntity.name = categorys ["name"] as? String
            categoryListEntity.url = categorys ["url"] as? String
            categoryListEntity.image = categorys ["image"] as? String
            return categoryListEntity
        }
        return nil
    }
    // MARK: - SaveCategoryList
    
     private func saveInCategotyList(array: [[String: AnyObject]]) {
        _ = array.map{self.createCategoryListEntityFrom(categorys: $0)}
        do {
            try CoreDataStack.sharedInstance.persistentContainer.viewContext.save()
        } catch let error {
            print(error)
        }
    }
    // MARK: - Load VideoNavigation
    
   private func loadVideoNavigation() {
        let apiManager = TFApiClient()
        
        do {
            let request = try TFRequest.init(path: .navigation)
            
            apiManager.fetch(request: request, completion: { (result) in
                
                switch result {
                case .success(let data):
                    print("Success:", data)
                    self.saveInCategotyList(array: [data])
                    
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

    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let categorList = fetchedhResultController.sections?.first?.numberOfObjects {
            return categorList
        }
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell") as! MenuTableViewCell
        
        if let category = fetchedhResultController.object(at: indexPath) as? CategoryList {
            cell.setCategoryListCellWith(category:category)
        }
        
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
