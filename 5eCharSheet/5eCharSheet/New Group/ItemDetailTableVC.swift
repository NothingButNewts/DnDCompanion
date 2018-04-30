//
//  ItemDetailTableVC.swift
//  5eCharSheet
//
//  Created by Student on 4/16/18.
//  Copyright © 2018 IsaacWalerstein. All rights reserved.
//

import Foundation

import UIKit

class ItemDetailTableVC: UITableViewController {
    let simpleCell = "simpleCell"
    let numSections = 2
    let rowsPerSection = 1
    enum MySection: Int {
        case title = 0, description
    }
    
    var item:Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return numSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowsPerSection
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: simpleCell, for: indexPath)
        
        // Configure the cell...
        if indexPath.section == MySection.title.rawValue{
            cell.textLabel?.text = item?.name
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 24.0)
        }
        
        // Configure the cell...
        if indexPath.section == MySection.description.rawValue{
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.text = item?.info
            cell.textLabel?.font = UIFont.systemFont(ofSize: 18.0)
        }
        cell.textLabel?.textColor = UIColor.white
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == MySection.title.rawValue{
            return 54.0
        }
        
        if indexPath.section == MySection.description.rawValue{
            return 120.0
        }
        
        return 44.0
    }
    
}
