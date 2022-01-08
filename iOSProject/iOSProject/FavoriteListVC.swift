//
//  FavoriteListVC.swift
//  iOSProject
//
//  Created by CTIS Student on 2.01.2022.
//  Copyright © 2022 CTIS. All rights reserved.
//

import UIKit
import CoreData

class FavoriteListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var mTableView: UITableView!
    
    var favFoods = [Favorite]()

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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favFoods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "favoritecell", for: indexPath) as UITableViewCell
               
        let items: [Favorite] = favFoods
        let item = items[indexPath.row]
               
        cell.textLabel?.text = item.strMeal
        cell.imageView?.image = UIImage(named: item.idMeal!)
               
               
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "favDetailVcId"){
            
            if let indexPath = getIndexPathForSelectedRow() {
            
                let favoriteFood = favFoods[indexPath.row]
                
                let detailViewController = segue.destination as! DetailVC
                
                let food = Food(strMeal: favoriteFood.strMeal!, strMealThumb: favoriteFood.strMealThumb!, idMeal: favoriteFood.idMeal!)
                
                detailViewController.mFood = food
                detailViewController.favBtnHidden = true;
            }
        }
        
    }
    
    func getIndexPathForSelectedRow() -> IndexPath? {
        var indexPath: IndexPath?
        
        if mTableView.indexPathsForSelectedRows!.count > 0 {
            indexPath = mTableView.indexPathsForSelectedRows![0] as IndexPath
        }
        
        return indexPath
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.fetchData()
    }
    

}
