//
//  Category.swift
//  iOSProject
//
//  Created by CTIS Student on 4.12.2021.
//  Copyright © 2021 CTIS. All rights reserved.
//


import Foundation

class Category {
    var idCategory: String
    var strCategory: String
    var strCategoryThumb: String
    var strCategoryDescription: String
    
    init(idCategory: String, strCategory: String, strCategoryThumb: String, strCategoryDescription: String) {
        self.idCategory = idCategory
        self.strCategory = strCategory
        self.strCategoryThumb = strCategoryThumb
        self.strCategoryDescription = strCategoryDescription
    }
        
}
