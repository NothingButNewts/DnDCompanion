//
//  Character.swift
//  ParkFinder
//
//  Created by Student on 4/9/18.
//  Copyright © 2018 IsaacWalerstein. All rights reserved.
//

import Foundation

public class Character: NSObject {
    
    static let sharedData = Character()
    var abilities = [10, 10, 10, 10, 10, 10]
    
    public override init() {
    }
}
