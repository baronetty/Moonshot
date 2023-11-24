//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Leo  on 24.11.23.
//

import Foundation


extension Bundle {
    func decode<T: Codable>(_ file: String) -> T { // T is placeholder for all kind of data -> Arrays, Dictionarys etc
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from Bundle")
        }
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from the Bundle")
        }
        return loaded
    }
}


