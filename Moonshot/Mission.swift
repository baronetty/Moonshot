//
//  Mission.swift
//  Moonshot
//
//  Created by Leo  on 24.11.23.
//

import Foundation

struct Mission: Codable, Identifiable { // nested struct
    struct CrewRole: Codable { // Mission.CrewRole
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date? // could be there, could not be there
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A" // it's an optional 
    }
}









