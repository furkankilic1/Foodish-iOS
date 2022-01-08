//
//  FoodDetail.swift
//
//  Created by CTIS Student on 4.12.2021.
//  Copyright © 2021 CTIS. All rights reserved.
//


import Foundation

class FoodDetail {
    var strMeal: String
    var strCategory: String
    var strInstructions: String
    var strMealThumb: String
    
    init(strMeal: String, strCategory: String, strInstructions: String, strMealThumb: String) {
        self.strMeal = strMeal
        self.strCategory = strCategory
        self.strInstructions = strInstructions
        self.strMealThumb = strMealThumb
    }
        
}
