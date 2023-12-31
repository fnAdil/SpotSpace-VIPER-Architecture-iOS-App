//
//  Spot.swift
//  spotspace
//
//  Created by Adil Özdemir on 4.09.2023.
//

import Foundation
import UIKit
import CoreLocation

struct Spot: Hashable, Codable {
    var id: String?
    var name: String?
    var subTitle: String?
    var description: String?
    var imageUrl: String?
    var isFavourite: Bool?
}

/*
struct Spot: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    var category: Category
    
    private var imageName: String
    
    var image: UIImage? {
        UIImage(named: imageName)
    }
    
    var featureImage: UIImage?{
        isFeatured ? UIImage(named: imageName+"_feature") : nil
    }

    private var coordinates: Coordinates
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
}
 */

enum Category: String, CaseIterable, Codable{
    case lakes = "Lakes"
    case rivers = "Rivers"
    case mountains = "Mountains"
}


struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
