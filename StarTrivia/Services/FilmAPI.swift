//
//  FilmAPI.swift
//  StarTrivia
//
//  Created by Abdullah Gebreil on 12/28/1440 AH.
//  Copyright © 1440 AH Abdullah Gebreil. All rights reserved.
//

import Foundation
import Alamofire
class FilmAPI {
    
    typealias completionHander = (Film?)->Void
    
    
    
    
    
    
    func getFilmData(url:String , completion: @escaping completionHander) {
        
        
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
                let film = try jsonDecoder.decode(Film.self, from: data)
                completion(film)
                
            } catch {
                print(error.localizedDescription)
                completion(nil)
                return
            }
        }
        
        
        
        
        
        
        
        
        
    }
}
