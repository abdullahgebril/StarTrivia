//
//  StarShips.swift
//  StarTrivia
//
//  Created by Abdullah Gebreil on 12/28/1440 AH.
//  Copyright © 1440 AH Abdullah Gebreil. All rights reserved.
//

import Foundation
struct StarShips : Codable {
    let  name :String?
    let model :String?
    let manufacturer : String?
    let speed :String?
    let cost:String?
    let crew:String?
    let length:String?
    let passenger:String?
    let consumables:String?
    
    enum Codingkeys:String , CodingKey {
        case name,model,manufacturer,length,crew,passengers,consumables
        case cost = "cost_in_credits"
        case speed = "max_atmosphering_speed"
    }
    
}
