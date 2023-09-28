//
//  WeatherError.swift
//  WeatherForecastApp
//
//  Created by Veerababu Mulugu on 8/31/23.
//

import Foundation

enum WeatherError: String, Error {
    
    case invalidUrl         = "This Invalid URL."
    case unableToComplete   = "Unable to complete your request. Please check your internet connection"
    case invalidResponse    = "Invalid response from the server. Please try again."
    case invalidData        = "The data received from the server was invalid. Please try again."
    case unableToFavorite   = "There was an error favoriting this user. Please try again."
   // case invalidResponseStatus400    = "Invalid response from the server. Please try again."

}

//enum networkError: Error {
//    case InvalidURL
//    case InvalidRes
//    case InvalidData
//}
