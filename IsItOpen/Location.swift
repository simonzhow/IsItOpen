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
    var locationID: String
    var locationHours: String
    var locationOpenStatus: Bool
    
    init (name: String, hours: String, open: Bool, id: String) {
        locationName = name
        locationID = id
        locationHours = hours
        locationOpenStatus = open
    }
}