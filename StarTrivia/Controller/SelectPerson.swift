//
//  ViewController.swift
//  StarTrivia
//
//  Created by Abdullah Gebreil on 12/25/1440 AH.
//  Copyright © 1440 AH Abdullah Gebreil. All rights reserved.
//

import UIKit

class SelectPerson: UIViewController {
    
    //Varaibles
 let personapi = PersonAPI()
    var person:Person!
  
    
    //outlets
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var hair: UILabel!
    @IBOutlet weak var birthyear: UILabel!
    @IBOutlet weak var mass: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var homeworldBtn: UIButton!
    @IBOutlet weak var vehiclesBtn: UIButton!
    @IBOutlet weak var filmsBtn: UIButton!
    @IBOutlet weak var starshipsBtn: UIButton!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
                
            }
    


    @IBAction func randomPressed(_ sender: Any) {
        let rand = Int.random(in: 0...87)
       spinner.startAnimating()
        personapi.getPersonDataUsingAlamofire(id: rand){ person in
        self.spinner.stopAnimating()
            if let person = person{
              self.setupView(person: person)
                self.person = person
            
                
    }
    
    
}
}
    func setupView(person:Person) {
       name.text = person.name
        height.text = person.height
        hair.text = person.hari
        birthyear.text = person.birthyear
        mass.text = person.mass
       gender.text = person.gender
        
        if person.vehicles.isEmpty {
            vehiclesBtn.isEnabled = false
            
        } else
        {
            vehiclesBtn.isEnabled = true
        }
        if person.vehicles.isEmpty {
            vehiclesBtn.isEnabled = false
            
        } else
        {
            vehiclesBtn.isEnabled = true
        }
        if person.starships.isEmpty {
            starshipsBtn.isEnabled = false
            
        } else
        {
            starshipsBtn.isEnabled = true
        }
        if person.films.isEmpty {
            filmsBtn.isEnabled = false
            
        } else
        {
            filmsBtn.isEnabled = true
        }
        if person.homeworld.isEmpty {
            homeworldBtn.isEnabled = false
            
        } else
        {
            homeworldBtn.isEnabled = true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toHomeworld" {
            if let destination = segue.destination as? HomeWorldVC {
                destination.person = person
            }
        }
        if segue.identifier == "toVehicles" {
            if let destination = segue.destination as? VehiclesVC {
                destination.person = person
            }
        }
        if segue.identifier == "toStarships" {
            if let destination = segue.destination as? StarShipsVC {
                destination.person = person
            }
        }
        if segue.identifier == "toFilms" {
            if let destination = segue.destination as? FilmsVc {
                destination.person = person
            }
        }
    }
}
