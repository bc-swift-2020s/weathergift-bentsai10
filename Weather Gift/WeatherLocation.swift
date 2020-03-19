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
    
    func getData(){
        let coordinates = "\(latitude),\(longitude)"
        let urlString = "\(APIurls.darkSkyURL)\(APIkeys.darkSkyKey)/\(coordinates)"

        print("we are accessing the URL: \(urlString)")

        //Create URL
        guard let url = URL(string: urlString) else{
            print("Error! Could not create URL!")
            return
        }
        //create session
        let session = URLSession.shared
        
        //get data with .dataTask method
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error{
                print("ERROR")
            }
            
            do{
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                print("\(json)")
            }catch{
                print("JSON ERROR")
            }
        }
        task.resume()
    }
}
