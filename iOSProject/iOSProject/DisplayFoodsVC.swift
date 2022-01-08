//
//  DisplayFoodsVC.swift
//  iOSProject
//
//  Created by CTIS Student on 18.12.2021.
//  Copyright © 2021 CTIS. All rights reserved.
//

import UIKit

class DisplayFoodsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var mTableView: UITableView!
    
    let mDataSource = DataSource()
    
    var mCategory = ""
    var mCountry = ""
    var searchByCategory = true // if it is true it will search by category othervise search by country
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mDataSource.mFoodList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "foodcell", for: indexPath) as UITableViewCell
               
        let items: [Food] = mDataSource.mFoodList
        let item = items[indexPath.row]
               
        cell.textLabel?.text = item.strMeal
        cell.imageView?.image = UIImage(named: item.idMeal)
               
               
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "detailVcId"){
            
            if let indexPath = getIndexPathForSelectedRow() {
            
                let food = mDataSource.mFoodList[indexPath.row]
                
                let detailViewController = segue.destination as! DetailVC
                
                detailViewController.mFood = food
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
        if searchByCategory == true {
            mDataSource.populateFoodByCategory(type: "foodbycategory", category: mCategory)
        }
        else {
            mDataSource.populateFoodByCountry(type: "foodbycountry", country: mCountry)
        }
        
    }

}
