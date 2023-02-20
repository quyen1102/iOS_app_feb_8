//
//  ModelData.swift
//  ios_app_feb_8
//
//  Created by Tran Thai Quyen on 09/02/2023.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var landmarks: [LandmarkFavorite] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
    
    // categories: Gom những category giống nhau thành một mảng.
    var categories: [String: [LandmarkFavorite]] {
         Dictionary(
             grouping: landmarks,
             by: { $0.category.rawValue }
         )
     }
    // add new compute featured to new array, have feature set true
    var features: [LandmarkFavorite] {
          landmarks.filter { $0.isFeatured }
      }
}


func load<T: Decodable>(_ filename: String) -> T {
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

