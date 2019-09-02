//
//  StarShipsApi.swift
//  StarTrivia
//
//  Created by Abdullah Gebreil on 12/28/1440 AH.
//  Copyright © 1440 AH Abdullah Gebreil. All rights reserved.
//

import Foundation
import Alamofire

class StarShipAPI {
    
    typealias completionHander = (StarShips?)->Void
    
    
    
    
    
  
    func getStarshipsData(url:String , completion: @escaping completionHander) {
    
        
        Alamofire.request(url).responseJSON { (response) in
            if let error  = response.result.error {
                print(error.localizedDescription)
                completion(nil)
                return
            }
        guard let data = response.data else {return completion(nil)}
        
        let jsonDecoder = JSONDecoder()
        do
        {
            let starship = try jsonDecoder.decode(StarShips.self, from: data)
            completion(starship)
            
        } catch {
            print(error.localizedDescription)
            completion(nil)
            return
        }
    }
    
    
    
    
    
    
    
    
    
}
}
