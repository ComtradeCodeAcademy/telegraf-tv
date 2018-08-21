//
//  CategoryList+CoreDataProperties.swift
//  TelegrafTV
//
//  Created by O on 8/2/18.
//  Copyright © 2018 Pedja Jevtic. All rights reserved.
//
//

import Foundation
import CoreData


extension CategoryList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CategoryList> {
        return NSFetchRequest<CategoryList>(entityName: "CategoryList")
    }

    @NSManaged public var image: String?
    @NSManaged public var name: String?
    @NSManaged public var url: String?

}
