
import Foundation
struct Vehicle : Codable {
	let name : String?
	let model : String?
	let manufacturer : String?
	let cost_in_credits : String?
	let length : String?
	let max_atmosphering_speed : String?
	let crew : String?
	let passengers : String?
	

	enum CodingKeys: String, CodingKey {

		case name = "name"
		case model = "model"
		case manufacturer = "manufacturer"
		case cost_in_credits = "cost_in_credits"
		case length = "length"
		case max_atmosphering_speed = "max_atmosphering_speed"
		case crew = "crew"
		case passengers = "passengers"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		model = try values.decodeIfPresent(String.self, forKey: .model)
		manufacturer = try values.decodeIfPresent(String.self, forKey: .manufacturer)
		cost_in_credits = try values.decodeIfPresent(String.self, forKey: .cost_in_credits)
		length = try values.decodeIfPresent(String.self, forKey: .length)
		max_atmosphering_speed = try values.decodeIfPresent(String.self, forKey: .max_atmosphering_speed)
		crew = try values.decodeIfPresent(String.self, forKey: .crew)
		passengers = try values.decodeIfPresent(String.self, forKey: .passengers)

	}

}
