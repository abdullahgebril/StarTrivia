//
//  VehicleAPI.swift
//  StarTrivia
//
//  Created by Abdullah Gebreil on 12/28/1440 AH.
//  Copyright © 1440 AH Abdullah Gebreil. All rights reserved.
//

import Foundation
import Alamofire

class VehicleAPI {

   typealias vehicleCompletion = (Vehicle?)->Void
    
    
    
    
    
    
    
    
    func getVehicleData(url:String , completionHandler: @escaping vehicleCompletion ) {
        
        guard let url = URL(string: url) else {return completionHandler(nil)}
        Alamofire.request(url).responseJSON { (response) in
            if let err = response.result.error {
                print(err.localizedDescription)
                completionHandler(nil)
                return
            }
            guard let data = response.data else{return completionHandler(nil)}
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                let vehicle = try jsonDecoder.decode(Vehicle.self, from: data)
                completionHandler(vehicle)
            }catch {
                print(error.localizedDescription)
                completionHandler(nil)
                return
            }
        }
        
        
    }
}
