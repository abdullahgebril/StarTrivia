//
//  PersonAPI.swift
//  StarTrivia
//
//  Created by Abdullah Gebreil on 12/25/1440 AH.
//  Copyright © 1440 AH Abdullah Gebreil. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON



class PersonAPI {
    typealias completion = (Person?)->Void
    
    
    
    
    
    // web request using alamofire and swiftyJson
    
    func getPersonDataUsingAlamofire(id: Int,complationHandler: @escaping completion) {
        
        guard let url = URL(string: "\(PERSON_URL)\(id)") else { return}
        
        Alamofire.request(url).responseJSON { (response) in
            if let error = response.result.error {
                print(error.localizedDescription)
                complationHandler(nil)
                return
            }
            
            guard let data = response.data else {return  complationHandler(nil)}
            do {
                
                let json = try JSON(data: data)
                let person = self.parsePersonUsingSwity(json: json)
                complationHandler(person)
            } catch {
                print(error.localizedDescription)
                complationHandler(nil)
            }
    }
    }
    //web request with Alamofire
  
//    func getPersonDataUsingAlamofire(id: Int,complationHandler: @escaping completion) {
//
//        guard let url = URL(string: "\(PERSON_URL)\(id)") else { return}
//
//        Alamofire.request(url).responseJSON { (response) in
//            if let error = response.result.error {
//                print(error.localizedDescription)
//                complationHandler(nil)
//            return
//            }
//
//            guard let json = response.result.value as? [String:Any] else {return complationHandler(nil)  }
//            let person = self.parsePersonManual(json: json)
//            complationHandler(person)
//        }
//    }
//
    
    
    //web request with URL Session
    func getPersonDataUsingUrlSession(id: Int,complationHandler: @escaping completion) {
        
        guard let url = URL(string: "\(PERSON_URL)\(id)") else { return}
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print(error.debugDescription)
              complationHandler(nil)
                return
            }
            guard let data = data else {return}
            do {
                
                let jsonobject = try JSONSerialization.jsonObject(with: data, options: [])
                guard let json = jsonobject as? [String:Any] else {return}
                let person = self.parsePersonManual(json: json)
       
                DispatchQueue.main.async {
                    
                
                complationHandler(person)
                }
            }catch {
                print(error.localizedDescription)
                return
            }
            
        }
        task.resume()
    }
    
    
    
    
    //parsing using SwiftyJson
    private func parsePersonUsingSwity(json:JSON)->Person {
        
        let name = json["name"].stringValue
        let heigth = json["height"].stringValue
        let mass = json["mass"].stringValue
        let hair_color = json["hair_color"].stringValue
        let birth_year = json["birth_year"].stringValue
        let gender = json["gender"].stringValue
        let homeworld = json["homeworld"].stringValue
        let films = json["films"].arrayValue.map({$0.stringValue})
        let species = json["species"].arrayValue.map({$0.stringValue})
        let vehicles = json["vehicles"].arrayValue.map({$0.stringValue})
        let starships = json["starships"].arrayValue.map({$0.stringValue})
        
        let person = Person(name: name, hari: hair_color, height: heigth, mass: mass, birthyear: birth_year, gender: gender, films: films, species: species, vehicles: vehicles, starships: starships, homeworld: homeworld)
        return person
        
    }
    
    
    // Parsing using manual methods
    private func parsePersonManual(json:[String:Any])->Person {
        
        let name = json["name"] as? String ?? ""
        let heigth = json["height"] as? String ?? ""
        let mass = json["mass"] as? String ?? ""
        let hair_color = json["hair_color"] as? String ?? ""
        let birth_year = json["birth_year"] as? String ?? ""
        let gender = json["gender"] as? String ?? ""
        let homeworld = json["homeworld"] as? String ?? ""
        let films = json["films"] as? [String] ?? [String]()
        let species = json["species"] as? [String] ?? [String]()
        let vehicles = json["vehicles"] as? [String] ?? [String]()
        let starships = json["starships"] as? [String] ?? [String]()
        
        let person = Person(name: name, hari: hair_color, height: heigth, mass: mass, birthyear: birth_year, gender: gender, films: films, species: species, vehicles: vehicles, starships: starships, homeworld: homeworld)
        return person
        
    }
}

