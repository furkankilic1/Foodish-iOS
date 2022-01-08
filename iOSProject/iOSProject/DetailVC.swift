//
//  DetailVC.swift
//  iOSProject
//
//  Created by CTIS Student on 18.12.2021.
//  Copyright © 2021 CTIS. All rights reserved.
//

import UIKit
import CoreData
import AVFoundation
import Alamofire

var player: AVAudioPlayer!

class DetailVC: UIViewController {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productCategory: UILabel!
    @IBOutlet weak var productDescription: UITextView!
    @IBOutlet weak var mTitle: UINavigationItem!
    
    let mDataSource = DataSource()
    
    var mFood: Food?
    
    var favFoods = [Favorite]()
    
    var newFav = Favorite?.self
    
    var favBtnHidden = false;
    
    @IBOutlet weak var favButton: UIBarButtonItem!
    
    @IBAction func manageFavorite(_ sender: UIBarButtonItem) {
        
        if(sender.title == "blank"){
            sender.image = UIImage(systemName: "star.fill")
            sender.title = "favorite"
            playSound(soundName: "note1")
            
            
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            let newFavoriteItem = Favorite.createInManagedObjectContext(context, idMeal: mFood!.idMeal, strMeal: mFood!.strMeal, strMealThumb: mFood!.strMealThumb )
            saveNewItem(idMeal: newFavoriteItem.idMeal!, strMeal: newFavoriteItem.strMeal!, strMealThumb: newFavoriteItem.strMealThumb!)
            
        }
        else{
            sender.image = UIImage(systemName: "star")
            sender.title = "blank"
            playSound(soundName: "note2")
            
                        
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Favorite")
            
            let search = mFood!.idMeal
            let mPredicate = NSPredicate(format: "idMeal contains[c] %@", search)
            
            fetchRequest.predicate = mPredicate
            
            let object = try! context.fetch(fetchRequest)
    
            favFoods = object as! [Favorite]
            
            context.delete(favFoods[0])
            save()
            
        }
        
    }
    
    
    // Our function to fetch data from Core Data
    func fetchData() {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Favorite")

        do {
            let results = try context.fetch(fetchRequest)
            favFoods = results as! [Favorite]
            //print(favFoods[0].idMeal)
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
    }
    
    // Method to save in Core Data
    func saveNewItem( idMeal : String, strMeal: String, strMealThumb: String ) {
        self.fetchData()
        save()
    }
    
    // Method to save the Data in Core Data
    func save() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            try context.save()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }

    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        
        do {
            try player =  AVAudioPlayer(contentsOf: url!)
        } catch {
            print("error")
        }
       
        player.play()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fetchData()
        
        if (favBtnHidden) {
            self.navigationItem.rightBarButtonItem = nil
        }
        else {
            // CHECK IF FOOD FOUNDS IN FAV CORE DATA
            if favFoods.contains(where: { (f) -> Bool in
                f.idMeal == mFood!.idMeal
            }) {
                favButton.image = UIImage(systemName: "star.fill")
                favButton.title = "favorite"
            }
            else {
                favButton.image = UIImage(systemName: "star")
                favButton.title = "blank"
            }
        }

        mDataSource.populateFoodDetail(type: "fooddetail", foodId: mFood!.idMeal)
        
        let foodDetail = mDataSource.mFoodDetailList[0]
        self.title = foodDetail.strMeal
        productName.text = "Product Name: " + foodDetail.strMeal
        productCategory.text = "Product Category: " + foodDetail.strCategory
        productDescription.text = foodDetail.strInstructions
        
        AF.request(foodDetail.strMealThumb).response { response in
            //debugPrint("Response: \(response)")
            if let data = response.data {
                self.productImage.image = UIImage(data: data)
            }
        }
        
        
        
    }
    
    
    
    
}
