//
//  ViewController.swift
//  ParkFinder
//
//  Created by Student on 3/22/18.
//  Copyright © 2018 IsaacWalerstein. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var charImage: UIImageView!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var levelField: UITextField!
    @IBOutlet weak var classField: UITextField!
    @IBOutlet weak var strLabel: UILabel!
    @IBOutlet weak var dexLabel: UILabel!
    @IBOutlet weak var conLabel: UILabel!
    @IBOutlet weak var wisLabel: UILabel!
    @IBOutlet weak var chaLabel: UILabel!
    @IBOutlet weak var intLabel: UILabel!
    @IBOutlet weak var currHealth: UITextField!
    @IBOutlet weak var maxHealth: UITextField!
    
    var char = Character.sharedData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(saveDefaultsData), name: NSNotification.Name.UIApplicationWillResignActive, object: nil)
        /*charImage.layer.borderColor = UIColor.white.cgColor
        charImage.layer.borderWidth = 2.5*/
        calcAbilities()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 13 {
            
        }
        self.view.endEditing(true)
        return true
    }
    
    func calcAbilities() {
        var tempMod = (char.abilities[0] - 10) / 2
        if tempMod > 0 {
            strLabel.text = "Strength \n\(char.abilities[0])        +\(tempMod)"
        }
        else {
            strLabel.text = "Strength \n\(char.abilities[0])        \(tempMod)"
        }
        tempMod = (char.abilities[1] - 10) / 2
        if tempMod > 0 {
            dexLabel.text = "Dexterity \n\(char.abilities[1])        +\(tempMod)"
        }
        else {
            dexLabel.text = "Dexterity \n\(char.abilities[1])        \(tempMod)"
        }
        tempMod = (char.abilities[2] - 10) / 2
        if tempMod > 0 {
            conLabel.text = "Constitution \n\(char.abilities[2])        +\(tempMod)"
        }
        else {
            conLabel.text = "Constitution \n\(char.abilities[2])        \(tempMod)"
        }
        tempMod = (char.abilities[3] - 10) / 2
        if tempMod > 0 {
            intLabel.text = "Intelligence \n\(char.abilities[3])        +\(tempMod)"
        }
        else {
            intLabel.text = "Intelligence \n\(char.abilities[3])        \(tempMod)"
        }
        tempMod = (char.abilities[4] - 10) / 2
        if tempMod > 0 {
            wisLabel.text = "Wisdom \n\(char.abilities[4])        +\(tempMod)"
        }
        else {
            wisLabel.text = "Wisdom \n\(char.abilities[4])        \(tempMod)"
        }
        tempMod = (char.abilities[5] - 10) / 2
        if tempMod > 0 {
            chaLabel.text = "Charisma \n\(char.abilities[5])        +\(tempMod)"
        }
        else {
            chaLabel.text = "Charisma \n\(char.abilities[5])        \(tempMod)"
        }
    }
    
    @IBAction func abilityButtonPressed(_ sender: UIButton) {
        if  sender.tag == 1 {
            char.abilities[0] += 1
        }
        if sender.tag == 2 {
            char.abilities[0] -= 1
        }
        if  sender.tag == 3 {
            char.abilities[1] += 1
        }
        if sender.tag == 4 {
            char.abilities[1] -= 1
        }
        if  sender.tag == 5 {
            char.abilities[2] += 1
        }
        if sender.tag == 6 {
            char.abilities[2] -= 1
        }
        if  sender.tag == 7 {
            char.abilities[3] += 1
        }
        if sender.tag == 8 {
            char.abilities[3] -= 1
        }
        if  sender.tag == 9 {
            char.abilities[4] += 1
        }
        if sender.tag == 10 {
            char.abilities[4] -= 1
        }
        if  sender.tag == 11 {
            char.abilities[5] += 1
        }
        if sender.tag == 12 {
            char.abilities[5] -= 1
        }
        calcAbilities()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.tag == 13 {
            let aSet = NSCharacterSet(charactersIn:"0123456789").inverted
            let compSepByCharInSet = string.components(separatedBy: aSet)
            let numberFiltered = compSepByCharInSet.joined(separator: "")
            return string == numberFiltered
        }
        return true
    }
    
    @objc func saveDefaultsData() {
        char.saveDefaultsData()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}

