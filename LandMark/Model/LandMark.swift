//
//  LandMark.swift
//  LandMark
//
//  Created by Abiezer Quiles on 11/5/24.
//

import Foundation
import SwiftUICore
import CoreLocation

//Hashable -> ??
// Codable -> enable the function of decode and encode data like JSON. In this case we use it to encode the Cordinates(I think)
//Identifiable -> this enables the the object to be use in a list without having to specify the unique Id it need to be displayed
//                  in a List. Because our object has an Id property, it know and fetch it in the background.

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
}
