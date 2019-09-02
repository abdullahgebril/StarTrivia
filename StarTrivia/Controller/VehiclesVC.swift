//
//  VehiclesVC.swift
//  StarTrivia
//
//  Created by Abdullah Gebreil on 12/27/1440 AH.
//  Copyright © 1440 AH Abdullah Gebreil. All rights reserved.
//

import UIKit

class VehiclesVC: UIViewController {
 
    //Varaibles
    var person:Person!
    let vehicle = VehicleAPI()
    var vehicles = [String]()
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var model: UILabel!
    @IBOutlet weak var maker: UILabel!
    @IBOutlet weak var passenger: UILabel!
    @IBOutlet weak var length: UILabel!
    @IBOutlet weak var spped: UILabel!
    @IBOutlet weak var crew: UILabel!
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var prevuios: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       vehicles = person.vehicles
        guard let fristVehicle = vehicles.first  else {return }
        vehicle.getVehicleData(url: fristVehicle) { (Vehicle) in
            if let vehicle = Vehicle {
                self.getvehivle(vehicle: vehicle)
            }
        }
    }
    func getvehivle(vehicle:Vehicle) {
        name.text = vehicle.name
        model.text = vehicle.model
        maker.text = vehicle.manufacturer
        passenger.text = vehicle.passengers
        length.text = vehicle.length
        spped.text = vehicle.speed
        crew.text = vehicle.crew
        cost.text = vehicle.cost
        
    }

    @IBAction func prevuiosClicked(_ sender: Any) {
    }
    @IBAction func nextClicked(_ sender: Any) {
    }
    
}
