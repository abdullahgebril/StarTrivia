//
//  StarShipsVC.swift
//  StarTrivia
//
//  Created by Abdullah Gebreil on 12/27/1440 AH.
//  Copyright © 1440 AH Abdullah Gebreil. All rights reserved.
//

import UIKit

class StarShipsVC: UIViewController {

    //varaible
    var person:Person!
    let starshipAPI = StarShipAPI()
    var starships = [String]()
    
    
    //Outlets
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var model: UILabel!
    @IBOutlet weak var manufacturer: UILabel!
    @IBOutlet weak var passenger: UILabel!
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var crew: UILabel!
    @IBOutlet weak var speed: UILabel!
    @IBOutlet weak var length: UILabel!
    @IBOutlet weak var consumables: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        starships = person.starships
        guard let starship = starships.first else {return}
        starshipAPI.getStarshipsData(url: starship) { (starship) in
            if let starship = starship {
                self.setupview(starship: starship)
            }
        }
   
    }
    
    
    func setupview(starship: StarShips) {
        name.text = starship.name
        model.text = starship.model
        manufacturer.text = starship.manufacturer
        passenger.text = starship.passenger
        cost.text = starship.cost
        crew.text = starship.crew
        speed.text = starship.speed
        length.text = starship.length
        consumables.text = starship.consumables
        
    }

  

}
