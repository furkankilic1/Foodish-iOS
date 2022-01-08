//
//  Favorite+CoreDataProperties.swift
//  iOSProject
//
//  Created by CTIS Student on 25.12.2021.
//  Copyright © 2021 CTIS. All rights reserved.
//
//

import Foundation
import CoreData


extension Favorite {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Favorite> {
        return NSFetchRequest<Favorite>(entityName: "Favorite")
    }

    @NSManaged public var idMeal: String?
    @NSManaged public var strMeal: String?
    @NSManaged public var strMealThumb: String?
    
}
