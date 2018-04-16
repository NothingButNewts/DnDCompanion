//
//  AddItemVC.swift
//  5eCharSheet
//
//  Created by Student on 4/16/18.
//  Copyright © 2018 IsaacWalerstein. All rights reserved.
//

import UIKit

class AddItemVC: UIViewController {

    var item:Item?
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    
    override func viewDidLoad() {
        title = "Add Item"
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let name = (nameField.text?.count)! > 0 ? nameField.text! : "No name entered"
        let description = (descriptionField.text?.count)! > 0 ? descriptionField.text! : "No description entered"
        item = Item(name: name, info: description)
    }

}
