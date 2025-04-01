//
//  Company.swift
//  YahooTakehomeAssessment
//
//  Created by Jayme Becker on 4/1/25.
//

import Foundation


/// Model to represent the company JSON returned from the API
struct Company: Codable, Identifiable, Hashable {
    var id: String { symbol }
    let name: String
    let symbol: String
    let marketCap: MarketCap
}


/// Model to represent the Market Cap data returned from the company JSON
struct MarketCap: Codable, Hashable {
    let formatted: String
    let longFormat: String
    let raw: Double
    
    enum CodingKeys: String, CodingKey {
        case formatted = "fmt"
        case longFormat = "longFmt"
        case raw
    }
}
