//
//  Locations.swift
//  IsItOpen
//
//  Created by Bibek Ghimire on 2/27/16.
//  Copyright © 2016 Simon Zhou. All rights reserved.
//

import Foundation

class Location {
    var locationName: String
    var locationData: LocationData
    
    init (name: String, data: LocationData) {
        locationName = name
        locationData = data
    }
}