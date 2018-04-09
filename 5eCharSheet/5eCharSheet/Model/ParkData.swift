//
//  ParkData.swift
//  ParkFinder
//
//  Created by Student on 3/23/18.
//  Copyright © 2018 IsaacWalerstein. All rights reserved.
//

import Foundation

public class ParkData: NSObject {

    static let sharedData = ParkData()
    var parks = [StatePark]()
    
    private override init() {
        
    }
}
