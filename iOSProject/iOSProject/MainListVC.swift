//
//  MainListVC.swift
//  iOSProject
//
//  Created by CTIS Student on 15.12.2021.
//  Copyright © 2021 CTIS. All rights reserved.
//

import UIKit

class MainListVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var mTableView: UITableView!
    @IBOutlet weak var mCollectionView: UICollectionView!
    
    let mDataSource = DataSource()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mDataSource.mCategoryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
               
        let items: [Category] = mDataSource.mCategoryList
        let item = items[indexPath.row]
               
        cell.textLabel?.text = item.strCategory
        cell.imageView?.image = UIImage(named: item.strCategory.lowercased())
               
               
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mDataSource.mCountryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CustomCollectionViewCell
        
        
        let items: [Country] = mDataSource.mCountryList
        let item = items[indexPath.row]
        
        cell.cellLabel.text = item.strArea
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "displayByCategory"){
            
            if let indexPath = getIndexPathForSelectedRow() {
                
                let category =  mDataSource.categories[indexPath.row]
                
                let displayFoodsController = segue.destination as! DisplayFoodsVC
                
                displayFoodsController.mCategory = category
                displayFoodsController.searchByCategory = true
            }
        }
        else if(segue.identifier == "displayByCountry") {
            
            if let indexPath = getIndexForSelectedRow() {
                
                let items: [Country] = mDataSource.mCountryList
                let item = items[indexPath.row]
                
                let displayFoodsController = segue.destination as! DisplayFoodsVC

                displayFoodsController.mCountry = item.strArea
                displayFoodsController.searchByCategory = false
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
    
    func getIndexForSelectedRow() -> IndexPath? {
        
        var indexPath: IndexPath?

        if mCollectionView.indexPathsForSelectedItems!.count > 0 {
            indexPath = mCollectionView.indexPathsForSelectedItems![0] as IndexPath
        }
               
        
        return indexPath
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        mDataSource.populate(type: "categories")
        mDataSource.populate(type: "countries")
    }
    
}
