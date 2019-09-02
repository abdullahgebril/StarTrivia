//
//  FilmsVc.swift
//  StarTrivia
//
//  Created by Abdullah Gebreil on 12/27/1440 AH.
//  Copyright © 1440 AH Abdullah Gebreil. All rights reserved.
//

import UIKit

class FilmsVc: UIViewController {

    //varaibles
    var person:Person!
    let filmapi = FilmAPI()
    var films = [String]()
    
    //outlets
    @IBOutlet weak var titlelbl: UILabel!
    
    @IBOutlet weak var episode: UILabel!
    
    @IBOutlet weak var director: UILabel!
    @IBOutlet weak var producer: UILabel!
    @IBOutlet weak var releaselbl: UILabel!
    @IBOutlet weak var openingCrawl: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        films = person.films
        guard let filmurl = films.first else {return}
        filmapi.getFilmData(url: filmurl) { (film) in
            if let film =  film  {
               self.setupfilmview(film: film)
            }
        }

    }
    
    func setupfilmview(film:Film) {
        titlelbl.text = film.title
        episode.text = ("\(film.episode)")
        director.text = film.director
        producer.text = film.producer
        releaselbl.text = film.release
        openingCrawl.text = film.openingCrawl
        
    }



}
