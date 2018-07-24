//
//  Structs.swift
//  TestWeatherApp
//
//  Created by Sergio Cavero Diaz on 16/07/2018.
//  Copyright © 2018 Sergio Cavero Diaz. All rights reserved.
//

import Foundation


struct WeatherDocument: Decodable {
    let coord: Coordinates?
    let weather: [Weather]?
    let base: String?
    let main: Main?
    let visibility: Double?
    let wind: Wind?
    let clouds: Clouds?
    let dt: Double?
    let sys: Sys?
    let id: Double?
    let name: String?
    let cod: Double?
}

struct Coordinates: Decodable {
    let lon : Double?
    let lat : Double?
}

struct Weather: Decodable {
    let id : Double?
    let main : String?
    let description: String?
    let icon: String?
}

struct Main: Decodable {
    let temp: Double?
    let pressure: Double?
    let humidity: Double?
    let temp_min: Double?
    let temp_max: Double?
}

struct Wind: Decodable {
    let speed: Double?
    let deg: Double?
}

struct Clouds: Decodable {
    let all: Double?
}

struct Sys: Decodable {
    let type: Double?
    let id: Double?
    let message: Double?
    let country: String?
    let sunrise: Double?
    let sunset: Double?
}


