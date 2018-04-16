//
//  Character.swift
//  ParkFinder
//
//  Created by Student on 4/9/18.
//  Copyright © 2018 IsaacWalerstein. All rights reserved.
//

import Foundation

class Character {
    
    static let sharedData = Character()
    var abilities = [10, 10, 10, 10, 10, 10]
    var items = [Item]()
    let abilitiesKey = "abilitiesKey"
    let itemsKey = "itemsKey"
    
    private init() {
        readDefaultsData()
    }
    
    public func saveDefaultsData() {
        print("Saving to defaults")
        let defaults = UserDefaults.standard
        defaults.set(abilities, forKey: abilitiesKey)
        print(items.count)
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: items)
        defaults.set(encodedData, forKey: itemsKey)
    }
    
    private func readDefaultsData(){
        let defaults = UserDefaults.standard
        if let tempAbilities = defaults.object(forKey: "abilitiesKey") {
            abilities = tempAbilities as! [Int]
        }
        else {
            abilities = [10, 10, 10, 10, 10, 10]
        }
        /*let decoded = defaults.object(forKey: "itemsKey") as! Data
        let decodedItems = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! [Item]
        items = decodedItems*/
    }
}
