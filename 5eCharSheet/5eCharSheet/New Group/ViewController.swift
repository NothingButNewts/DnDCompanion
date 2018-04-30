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
    @IBOutlet weak var health: UILabel!
    @IBOutlet weak var ACLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var profLabel: UILabel!
    @IBOutlet weak var rollField: UITextField!
    @IBOutlet weak var diceField: UITextField!
    @IBOutlet weak var plusField: UITextField!
    @IBOutlet weak var rolledLabel: UILabel!
    
    var char = Character.sharedData
    var roll = 1
    var dice = 20
    var plus = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(saveDefaultsData), name: NSNotification.Name.UIApplicationWillResignActive, object: nil)
        /*charImage.layer.borderColor = UIColor.white.cgColor
        charImage.layer.borderWidth = 2.5*/
        calcAbilities()
        setInfo()
        calcProf()
        rollDice(self)
    }
    
    func setInfo() {
        nameField.text = char.name
        classField.text = char.clas
        levelField.text = String(char.lvl)
        health.text = "\(char.health)  /  \(char.maxHealth)"
    }
    
    func calcProf() {
        if (char.lvl < 5) {
            char.proficiency = 2
        }
        else if (char.lvl < 9) {
            char.proficiency = 3
        }
        else if (char.lvl < 13) {
            char.proficiency = 4
        }
        else if (char.lvl < 17) {
            char.proficiency = 5
        }
        else {
            char.proficiency = 6
        }
        profLabel.text = String(char.proficiency)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 13 && textField.text != "" {
            char.health = Int(textField.text!)!
            health.text = "\(char.health)  /  \(char.maxHealth)"
        }
        if textField.tag == 14 && textField.text != "" {
            char.maxHealth = Int(textField.text!)!
            health.text = "\(char.health)  /  \(char.maxHealth)"
        }
        if textField.tag == 15 && textField.text != "" {
            char.name = textField.text!
        }
        if textField.tag == 16 && textField.text != "" {
            char.lvl = Int(textField.text!)!
            calcProf()
        }
        if textField.tag == 17 && textField.text != "" {
            char.clas = textField.text!
        }
        if textField.tag == 18 && textField.text != "" {
            char.AC = Int(textField.text!)!
            ACLabel.text = textField.text
        }
        if textField.tag == 19 && textField.text != "" {
            char.speed = Int(textField.text!)!
            speedLabel.text = textField.text
        }
        if textField.tag == 20 && textField.text != "" {
            roll = Int(textField.text!)!
        }
        if textField.tag == 21 && textField.text != "" {
            dice = Int(textField.text!)!
        }
        if textField.tag == 22 && textField.text != "" {
            plus = Int(textField.text!)!
        }
        self.view.endEditing(true)
        return false
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
    
    @IBAction func rollDice(_ sender: Any) {
        var rolled = 0
        for _ in 1...roll {
            rolled += Int(arc4random_uniform(UInt32(dice))) + 1
        }
        rolled += plus
        rolledLabel.text = String(rolled)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.tag == 13 || textField.tag == 14 || textField.tag == 16 {
            let aSet = NSCharacterSet(charactersIn:"0123456789").inverted
            let compSepByCharInSet = string.components(separatedBy: aSet)
            let numberFiltered = compSepByCharInSet.joined(separator: "")
            return string == numberFiltered
        }
        if textField.tag == 18 || textField.tag == 19  || textField.tag == 20 || textField.tag == 21 || textField.tag == 22 {
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

