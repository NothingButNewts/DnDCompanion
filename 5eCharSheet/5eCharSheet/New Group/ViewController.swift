//
//  ViewController.swift
//  ParkFinder
//
//  Created by Student on 3/22/18.
//  Copyright © 2018 IsaacWalerstein. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var strLabel: UILabel!
    @IBOutlet weak var dexLabel: UILabel!
    @IBOutlet weak var conLabel: UILabel!
    @IBOutlet weak var wisLabel: UILabel!
    @IBOutlet weak var chaLabel: UILabel!
    @IBOutlet weak var intLabel: UILabel!
    var char = Character()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calcAbilities()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    func calcAbilities() {
        strLabel.text = "Strength \n\(char.abilities[0])        \((char.abilities[0] - 10) / 2)"
        dexLabel.text = "Dexterity \n\(char.abilities[1])        \((char.abilities[1] - 10) / 2)"
        conLabel.text = "Constitution \n\(char.abilities[2])        \((char.abilities[2] - 10) / 2)"
        intLabel.text = "Intelligence \n\(char.abilities[3])        \((char.abilities[3] - 10) / 2)"
        wisLabel.text = "Wisdom \n\(char.abilities[4])        \((char.abilities[4] - 10) / 2)"
        chaLabel.text = "Charisma \n\(char.abilities[5])        \((char.abilities[5] - 10) / 2)"
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
}

