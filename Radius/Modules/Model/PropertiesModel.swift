//
//  PropertiesModel.swift
//  Radius
//
//  Created by Shreyansh Raj Keshri on 28/03/22.
//

import Foundation


// MARK: - PropertiesModel
struct PropertiesModel: Decodable {
    let facilities: [Facility]
    let exclusions: [[Exclusion]]
    
    init() {
        facilities = []
        exclusions = []
    }
}

// MARK: - Facility
struct Facility: Decodable {
    let facilityID, name: String
    let options: [Option]

    enum CodingKeys: String, CodingKey {
        case facilityID = "facility_id"
        case name, options
    }
}

// MARK: - Option
struct Option: Decodable {
    let name, icon, id: String
}

// MARK: - Exclusion
struct Exclusion: Decodable, Equatable {
    let facilityID, optionsID: String

    enum CodingKeys: String, CodingKey {
        case facilityID = "facility_id"
        case optionsID = "options_id"
    }
    
    static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.facilityID == rhs.facilityID && lhs.optionsID == rhs.optionsID
    }
    
}
