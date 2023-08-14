//
//  Geocoding Model.swift
//  RandomSoju
//
//  Created by 원준연 on 2023/07/17.
//

import Foundation


struct PlaceResponse: Codable {
//    let meta: Meta?
    let places: [Document]?
    
    enum CodingKeys: String, CodingKey {
        case places = "documents"
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseDocument { response in
//     if let document = response.result.value {
//       ...
//     }
//   }

// MARK: - Document
struct Document: Codable {
    let placeName, distance, phone: String?
    let placeURL: String?
//    let categoryName, addressName, roadAddressName, id: String?
//    let phone, categoryGroupCode, categoryGroupName,
    let x: String?, y: String?
    let imageUrl: String?

    enum CodingKeys: String, CodingKey {
        case placeName = "place_name"
        case distance, phone
        case placeURL = "place_url"
//        case categoryName = "category_name"
//        case addressName = "address_name"
//        case roadAddressName = "road_address_name"
//        case id, phone
//        case categoryGroupCode = "category_group_code"
//        case categoryGroupName = "category_group_name"
        case imageUrl
        case x, y
    }
}

