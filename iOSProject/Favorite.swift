//
//  Favorite+CoreDataClass.swift
//  iOSProject
//
//  Created by CTIS Student on 25.12.2021.
//  Copyright © 2021 CTIS. All rights reserved.
//
//

import Foundation
import CoreData


public class Favorite: NSManagedObject {
    class func createInManagedObjectContext(_ context: NSManagedObjectContext, idMeal: String, strMeal: String, strMealThumb: String) -> Favorite {
        let favoriteObject = NSEntityDescription.insertNewObject(forEntityName: "Favorite", into: context) as! Favorite
        favoriteObject.idMeal = idMeal
        favoriteObject.strMeal = strMeal
        favoriteObject.strMealThumb = strMealThumb

        return favoriteObject
    }
}
