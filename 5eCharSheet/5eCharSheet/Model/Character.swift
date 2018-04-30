//
//  Character.swift
//  ParkFinder
//
//  Created by Student on 4/9/18.
//  Copyright © 2018 IsaacWalerstein. All rights reserved.
//

import Foundation

class Character {
    
    // character related info and keys for storage
    static let sharedData = Character()
    var abilities = [10, 10, 10, 10, 10, 10]
    var items = [Item]()
    var name = "Name"
    var clas = "Class"
    var lvl = 1
    var speed = 6
    var AC = 10
    var proficiency = 0
    var health = 0
    var maxHealth = 10
    let abilitiesKey = "abilitiesKey"
    let itemsKey = "itemsKey"
    let nameKey = "nameKey"
    let classKey = "classKey"
    let lvlKey = "levelKey"
    let healthKey = "healthKey"
    let maxHealthKey = "maxHealthKey"
    let speedKey = "speedKey"
    let ACKey = "ACKey"
    let profKey = "profKey"
    
    private init() {
        readDefaultsData()
    }
    
    // store important information
    public func saveDefaultsData() {
        print("Saving to defaults")
        let defaults = UserDefaults.standard
        defaults.set(abilities, forKey: abilitiesKey)
        defaults.set(name, forKey: nameKey)
        print(name)
        defaults.set(clas, forKey: classKey)
        defaults.set(lvl, forKey: lvlKey)
        defaults.set(health, forKey: healthKey)
        defaults.set(maxHealth, forKey: maxHealthKey)
        defaults.set(speed, forKey: speedKey)
        defaults.set(AC, forKey: ACKey)
        defaults.set(proficiency, forKey: profKey)
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: items)
        defaults.set(encodedData, forKey: itemsKey)
    }
    
    // save character info to user defaults and encode items
    private func readDefaultsData(){
        let defaults = UserDefaults.standard
        if let tempAbilities = defaults.object(forKey: "abilitiesKey") {
            abilities = tempAbilities as! [Int]
        }
        else {
            abilities = [10, 10, 10, 10, 10, 10]
        }
        if let tempName = defaults.object(forKey: nameKey) {
            name = tempName as! String
        }
        else {
            name = "DName"
        }
        if let tempClass = defaults.object(forKey: classKey) {
            clas = tempClass as! String
        }
        else {
            clas = "Class"
        }
        if let tempLevel = defaults.object(forKey: lvlKey) {
            lvl = tempLevel as! Int
        }
        else {
            lvl = 1
        }
        if let tempHealth = defaults.object(forKey: healthKey) {
            health = tempHealth as! Int
        }
        else {
            health = 1
        }
        if let tempMaxHealth = defaults.object(forKey: maxHealthKey) {
            maxHealth = tempMaxHealth as! Int
        }
        else {
            maxHealth = 10
        }
        if let tempSpeed = defaults.object(forKey: speedKey) {
            speed = tempSpeed as! Int
        }
        else {
            speed = 6
        }
        if let tempAC = defaults.object(forKey: ACKey) {
            AC = tempAC as! Int
        }
        else {
            AC = 10
        }
        let decoded = defaults.object(forKey: "itemsKey") as? Data
        let decodedItems = NSKeyedUnarchiver.unarchiveObject(with: decoded!) as? [Item]
        items = decodedItems!
    }
}
