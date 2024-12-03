//
//  ModelData.swift
//  LandMark
//
//  Created by Abiezer Quiles on 11/5/24.
//

import Foundation

//ModelData is the repositoty for the our data
@Observable
class ModelData {
    var landmarks: [Landmark] = load(filename: "landmarkData.json")
    var hikes: [Hike] = load(filename: "hikeData.json")
    
    var features: [Landmark] {
           landmarks.filter { $0.isFeatured }
       }
    
    var categories: [String: [Landmark]] {
            Dictionary(
                grouping: landmarks,
                by: { $0.category.rawValue }
            )
        }
}

//TODO: Find a way to abstrac more the way we get `landmarks`
//var landmarks: [Landmark] = load(filename: "landmarkData.json")

func load<T: Decodable>(filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
