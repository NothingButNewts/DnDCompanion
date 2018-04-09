//
//  StatePark.swift
//  ParkFinder
//
//  Created by Student on 3/22/18.
//  Copyright © 2018 IsaacWalerstein. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

public struct StateParkList: Codable {
    var parks: [StatePark]
}

public class StatePark: NSObject, Codable, MKAnnotation {
    public var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake(CLLocationDegrees(latitude), CLLocationDegrees(longitude))
    }
    
    
    private var name:String
    private var latitude:Double
    private var longitude:Double
    
    public var title:String? {
        return name
    }
    
    public var subtitle: String? {
        return "I <3 NY"
    }
    
    enum CodingKeys: String, CodingKey {
        case name // = "parkName"
        case latitude
        case longitude
    }
    
    init(name:String,latitude:Double,longitude:Double) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }
    
    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.name = (try? values.decode(String.self, forKey: .name)) ?? "No title found"
        
        let latitudeString = try values.decode(String.self, forKey: .latitude)
        let longitudeString = try values.decode(String.self, forKey: .longitude)
        self.latitude = Double(latitudeString)!
        self.longitude = Double(longitudeString)!
    }
    
    public override var description: String{
        return "\(name) : (\(latitude),\(longitude))"
    }
}
