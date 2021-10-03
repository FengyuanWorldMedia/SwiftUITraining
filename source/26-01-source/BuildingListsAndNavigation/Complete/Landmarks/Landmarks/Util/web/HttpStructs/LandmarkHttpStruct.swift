// Created by SwiftUIManager on 2021/09/27.
// Copyright © 2021 Suzhou Fengyuan World Media. All rights reserved.

import Foundation

/// =============List========================
public struct LandmarkReq : Codable {
     
    public var filter : String
    public var type : Int
    
    public init() {
        self.filter = ""
        self.type = 0
    }
    
    enum CodingKeys : String, CodingKey {
         case filter = "filter"
         case type = "type"
    }
}

public struct LandmarkRes : Codable {
     
    public var marks : [OneLandmark]
    
    public init() {
        self.marks = []
    }
    enum CodingKeys : String, CodingKey {
         case marks = "marks"
    }
}

public struct OneLandmark : Codable {
     
    public var id : Int
    public var imageName : String
    public var name : String
    
    public init() {
        self.id = 0
        self.imageName = ""
        self.name = ""
    }
    enum CodingKeys : String, CodingKey {
         case id = "id"
         case imageName = "image_name"
         case name = "name"
    }
}
/// ==============list=======================

public struct LandmarkDetailReq : Codable {
    
    public var id : Int
    
    public init() {
        self.id = 0
    }
    
    enum CodingKeys : String, CodingKey {
         case id = "id"
    }
}

public struct LandmarkDetailRes : Codable {
    
    public var name : String
    public var category : String
    public var city : String
    public var state : String
    public var id : Int
    public var park : String
    public var coordinates: CoordinatesRes
    public var imageName : String
    public var likeCount : Int?
    
    public init() {
        self.name          = ""
        self.category      = ""
        self.city          = ""
        self.state         = ""
        self.id            = 0
        self.park          = ""
        self.coordinates   = CoordinatesRes()
        self.imageName     = ""
    }
    
    enum CodingKeys : String, CodingKey {
        case name         = "name"
        case category     = "category"
        case city         = "city"
        case state        = "state"
        case id           = "id"
        case park         = "park"
        case coordinates  = "coordinates"
        case imageName    = "image_name"
        case likeCount    = "like_count"
    }
}

public struct CoordinatesRes : Codable {
     
    public var latitude: Double
    public var longitude: Double
    
    public init() {
        self.latitude  = 0
        self.longitude = 0
    }
    
    enum CodingKeys : String, CodingKey {
        case latitude  = "latitude"
        case longitude = "longitude"
    }
}
