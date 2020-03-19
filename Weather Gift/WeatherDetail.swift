//
//  WeatherDetail.swift
//  Weather Gift
//
//  Created by Ben Tsai on 3/19/20.
//  Copyright © 2020 Ben Tsai. All rights reserved.
//

import Foundation

class WeatherDetail: WeatherLocation{
    
    struct Result: Codable{
        var timezone: String
        var currently: Currently
        var daily: Daily
        
    }
    struct Currently: Codable {
        var temperature: Double
    }
    struct Daily: Codable {
        var summary: String
    }
    
    var timezone = ""
    var temperature = 0
    var summary = ""
    
    func getData(completed: @escaping () -> ()){
        let coordinates = "\(latitude),\(longitude)"
        let urlString = "\(APIurls.darkSkyURL)\(APIkeys.darkSkyKey)/\(coordinates)"

        print("we are accessing the URL: \(urlString)")

        //Create URL
        guard let url = URL(string: urlString) else{
            print("Error! Could not create URL!")
            completed()
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
                let result = try JSONDecoder().decode(Result.self, from: data!)
                self.timezone = result.timezone
                self.temperature = Int(result.currently.temperature.rounded())
                self.summary = result.daily.summary
            }catch{
                print("JSON ERROR")
            }
            completed()
        }
        task.resume()
    }
}
