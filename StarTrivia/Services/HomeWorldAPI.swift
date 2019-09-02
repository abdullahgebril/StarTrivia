//
//  HomeWorldAPI.swift
//  StarTrivia
//
//  Created by Abdullah Gebreil on 12/27/1440 AH.
//  Copyright © 1440 AH Abdullah Gebreil. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class HomeWorldAPI {
    
    typealias completionHandler = (HomeWorld?)->Void
    //web request using swifty
    func gethomeworldData(url:String, completion: @escaping completionHandler) {
     
        Alamofire.request(url).responseJSON { (response) in
            if let error = response.result.error {
                print(error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = response.data else{return completion(nil)}
            do {
                let json = try JSON(data: data)
                let homeworld = self.parsingHomeWorldData(json: json)
                completion(homeworld)
            } catch{
                print(error.localizedDescription)
                
                completion(nil)
                return
            }
        }
    }
    func parsingHomeWorldData(json:JSON)->HomeWorld {
        let name = json["name"].stringValue
        let climate = json["climate"].stringValue
        let terrain = json["terrain"].stringValue
        let population = json["population"].stringValue
        let homeworld = HomeWorld(name: name, climate: climate, terrain: terrain, population: population)
        return homeworld
    }
}
