//
//  HomeWorldVC.swift
//  StarTrivia
//
//  Created by Abdullah Gebreil on 12/27/1440 AH.
//  Copyright © 1440 AH Abdullah Gebreil. All rights reserved.
//

import UIKit

class HomeWorldVC: UIViewController {
 
    //Varaibles
    var person:Person!
    
    let homeworldapi = HomeWorldAPI()
    
    @IBOutlet weak var namelbl: UILabel!
    @IBOutlet weak var climate: UILabel!
    @IBOutlet weak var terrain: UILabel!
    @IBOutlet weak var population: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeworldapi.gethomeworldData(url: person.homeworld) { (homeworld) in
            if let homeworld = homeworld {
                self.setupview(homeworld: homeworld)
            }
        }
    }
    

    func setupview(homeworld:HomeWorld) {
    namelbl.text = homeworld.name
    climate.text = homeworld.climate
    terrain.text = homeworld.terrain
    population.text = homeworld.population
        
    }

}
