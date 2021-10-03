// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import SwiftUI
import CoreLocation

struct LandmarkMaster: Hashable, Codable, Identifiable {
    
    var name: String
    var id: Int
    var imageName: String
    
    enum CodingKeys : String, CodingKey {
        case name        = "name"
        case id          = "id"
        case imageName   = "imageName"
    }
}

struct Landmark: Hashable, Codable, Identifiable {
    
    var name: String
    var category: String
    var city: String
    var state: String
    var id: Int
    var park: String
    var coordinates: Coordinates
    var imageName: String
    var likeCount: Int?
    
    enum CodingKeys : String, CodingKey {
        
        case name        = "name"
        case category    = "category"
        case city        = "city"
        case state       = "state"
        case id          = "id"
        case park        = "park"
        case coordinates = "coordinates"
        case imageName   = "imageName"
        case likeCount   = "like_count"
    }
    
}

struct Coordinates: Hashable, Codable {
    var longitude: Double
    var latitude: Double
    enum CodingKeys : String, CodingKey {
         case longitude       = "longitude"
         case latitude        = "latitude"
         
    }
}
