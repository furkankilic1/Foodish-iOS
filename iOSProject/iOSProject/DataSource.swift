//
//  DataSource
//  iOSProject
//
//  Created by CTIS Student on 2022.
//  Copyright © 2021 CTIS. All rights reserved.
//

import Foundation

class DataSource {
    var mCategoryList: [Category] = []
    var mCountryList: [Country] = []
    var mFoodList: [Food] = []
    var mFoodDetailList: [FoodDetail] = []
    var categories: [String] = []
    
    func numbeOfItemsInEachCategory(index: Int) -> Int {
        return itemsInCategory(index: index).count
    }
    
    // MARK: - Populate Data from files
    func populate(type: String) {
        if type.lowercased() == "categories" {
            if let mURL = URL(string: "https://www.themealdb.com/api/json/v1/1/categories.php") {
                if let data = try? Data(contentsOf: mURL) {
                    
                    guard let json = try? JSON(data: data) else {
                        print("Error with JSON")
                        return
                    }
                    
                    for index in 0..<json["categories"].count {
                        let idCategory = json["categories"][index]["idCategory"].string!
                        let strCategory = json["categories"][index]["strCategory"].string!
                        let strCategoryThumb = json["categories"][index]["strCategoryThumb"].string!
                        let strCategoryDescription = json["categories"][index]["strCategoryDescription"].string!
                        
                        let mCategory = Category(idCategory: idCategory, strCategory: strCategory, strCategoryThumb: strCategoryThumb, strCategoryDescription: strCategoryDescription)
                        mCategoryList.append(mCategory)
                        
                        if !categories.contains(strCategory) {
                            categories.append(strCategory)
                        }
                        
                    }
                }
                else {
                    print("Json Data error")
                }
            }
        }
        else if type.lowercased() == "countries"{
            if let mURL = URL(string: "https://www.themealdb.com/api/json/v1/1/list.php?a=list") {
                if let data = try? Data(contentsOf: mURL) {
                    
                    guard let json = try? JSON(data: data) else {
                        print("Error with JSON")
                        return
                    }
                    
                    for index in 0..<json["meals"].count {
                        let strArea = json["meals"][index]["strArea"].string!

                        let mCountry = Country(strArea: strArea)
                        mCountryList.append(mCountry)
                        
                    }
                }
                else {
                    print("Json Data error")
                }
            }
        }
    }
    
    func populateFoodByCategory(type: String, category: String) {
        if type.lowercased() == "foodbycategory" {
            if let mURL = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=" + category) {
                if let data = try? Data(contentsOf: mURL) {
                    
                    guard let json = try? JSON(data: data) else {
                        print("Error with JSON")
                        return
                    }
                    
                    for index in 0..<json["meals"].count {
                        let strMeal = json["meals"][index]["strMeal"].string!
                        let strMealThumb = json["meals"][index]["strMealThumb"].string!
                        let idMeal = json["meals"][index]["idMeal"].string!
                        
                        let mFood = Food(strMeal: strMeal, strMealThumb: strMealThumb, idMeal: idMeal)
                       
                        mFoodList.append(mFood)
                        
                        
                    }
                }
                else {
                    print("Json Data error")
                }
            }
        }
        
    }
    
    func populateFoodByCountry(type: String, country: String) {
        if type.lowercased() == "foodbycountry" {
            if let mURL = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?a=" + country) {
                if let data = try? Data(contentsOf: mURL) {
                    
                    guard let json = try? JSON(data: data) else {
                        print("Error with JSON")
                        return
                    }
                    
                    for index in 0..<json["meals"].count {
                        let strMeal = json["meals"][index]["strMeal"].string!
                        let strMealThumb = json["meals"][index]["strMealThumb"].string!
                        let idMeal = json["meals"][index]["idMeal"].string!
                        
                        let mFood = Food(strMeal: strMeal, strMealThumb: strMealThumb, idMeal: idMeal)
                       
                        mFoodList.append(mFood)
                        
                        
                    }
                }
                else {
                    print("Json Data error")
                }
            }
        }
        
    }
    
    func populateFoodDetail(type: String, foodId: String) {
        if type.lowercased() == "fooddetail" {
            if let mURL = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=" + foodId) {
                if let data = try? Data(contentsOf: mURL) {
                    
                    guard let json = try? JSON(data: data) else {
                        print("Error with JSON")
                        return
                    }
                    //print(json)
                    for index in 0..<json["meals"].count {
                        let strMeal = json["meals"][index]["strMeal"].string!
                        let strCategory = json["meals"][index]["strCategory"].string!
                        let strInstructions = json["meals"][index]["strInstructions"].string!
                        let strMealThumb = json["meals"][index]["strMealThumb"].string!
                        
                        let mFoodDetail = FoodDetail(strMeal: strMeal, strCategory: strCategory, strInstructions: strInstructions, strMealThumb: strMealThumb)
                       
                        mFoodDetailList.append(mFoodDetail)
                        
                    }
                }
                else {
                    print("Json Data error")
                }
            }
        }
        
    }
    
    func itemsInCategory(index: Int) -> [Category] {
        let item = categories[index]
        
        let filteredItems = mCategoryList.filter { (category: Category) -> Bool in
            return category.strCategory == item
        }
        
        return filteredItems
    }
    
    
    }
