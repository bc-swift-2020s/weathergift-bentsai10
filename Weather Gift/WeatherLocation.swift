//
//  WeatherLocation.swift
//  Weather Gift
//
//  Created by Ben Tsai on 3/8/20.
//  Copyright © 2020 Ben Tsai. All rights reserved.
//

import Foundation

class WeatherLocation: Codable{
    var name: String
    var latitude: Double
    var longitude: Double
    
    init(name:String, latitude: Double, longitude: Double) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }
}
