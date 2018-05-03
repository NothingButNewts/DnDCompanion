//
//  ItemTableVC.swift
//  5eCharSheet
//
//  Created by Student on 4/16/18.
//  Copyright © 2018 IsaacWalerstein. All rights reserved.
//

import UIKit

class ItemTableVC: UITableViewController {
    
    let simpleCell = "simpleCell"
    let myAddItemSegue = "addItemSegue"
    var char = Character.sharedData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Items"
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
    }
    
    @objc func addItem() {
        performSegue(withIdentifier: myAddItemSegue, sender: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return char.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: simpleCell, for: indexPath)
        let item = char.items[indexPath.row]
        cell.textLabel?.text = item.name
        cell.textLabel?.textColor = UIColor.white
        
        return cell
    }
    
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
         if editingStyle == .delete {
            char.items.remove(at: indexPath.row)
             // Delete the row from the data source
             tableView.deleteRows(at: [indexPath], with: .fade)
         }
        else if editingStyle == .insert {
        }
     }
    
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let itemToMove = char.items.remove(at: fromIndexPath.row)
        char.items.insert(itemToMove, at: to.row)
     }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow{
            let selectedRow = indexPath.row
            guard selectedRow < char.items.count else{
                print("row \(selectedRow) is not in items!)")
                return
            }
            let detailVC = segue.destination as! ItemDetailTableVC
            detailVC.item = char.items[selectedRow]
        }
    }
    
    @IBAction func unwindWithDoneTapped(segue:UIStoryboardSegue){
        print("unwindWithDoneTapped")
        if let addItemVC = segue.source as? AddItemVC {
            if let item = addItemVC.item {
                char.items.append(item)
                tableView.reloadData()
                char.loaded = true
            }
        }
    }
    
    @IBAction func unwindWithCancelTapped(segue:UIStoryboardSegue) {
        print("unwindWithCancelTapped")
    }
    
}
