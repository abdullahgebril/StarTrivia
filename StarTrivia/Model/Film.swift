
import Foundation
struct Film : Codable {
    let title : String?
    let episode : Int?
    let openingCrawl : String?
    let director : String?
    let producer : String?
    let release : String?
   
    
    enum CodingKeys: String, CodingKey {
        
        case title = "title"
        case episode = "episode_id"
        case openingCrawl = "opening_crawl"
        case director = "director"
        case producer = "producer"
        case release = "release_date"
      
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        episode = try values.decodeIfPresent(Int.self, forKey: .episode)
        openingCrawl = try values.decodeIfPresent(String.self, forKey: .openingCrawl)
        director = try values.decodeIfPresent(String.self, forKey: .director)
        producer = try values.decodeIfPresent(String.self, forKey: .producer)
        release = try values.decodeIfPresent(String.self, forKey: .release)
       
    }
    

    
}
