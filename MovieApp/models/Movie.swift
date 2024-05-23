//
//  Movie.swift
//  MovieApp
//
//  Created by JETSMobileLabMini2 on 24/04/2024.
//

import Foundation
import UIKit

struct Movie : Codable{
    var title : String
    var rating : Float
    var year : Int
    var genre: [String]
    var image: String
    
    enum CodingKeys : String, CodingKey{
        case title = "title"
        case rating = "rating"
        case genre = "genre"
        case year = "year"
        case image = "poster"
    }
}

