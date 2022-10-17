//
//  Product.swift
//  JLPTechTest
//
//  Created by Tom Pearson on 01/10/2022.
//

import Foundation

struct Product: Codable, Equatable {
    struct Price: Codable, Equatable {
        let currency, now: String
    }
    
    struct Media: Codable, Equatable {
        let images: Images
    }
    
    struct Images: Codable, Equatable {
        let urls: [String]
    }
    
    struct Attribute: Codable, Equatable {
        let name, value: String
        let multivalued: Bool
        let values: [String]
    }
    
    struct Feature: Codable, Equatable {
        let attributes: [Attribute]
    }
    
    struct Details: Codable, Equatable {
        let productInformation: String
        let features: [Feature]
    }
    
    struct AdditionalServices: Codable, Equatable {
        let includedServices: [String]
    }
    
    let price: Price
    let media: Media
    let details: Details
    let title: String
    let additionalServices: AdditionalServices
    let code: String
    let displaySpecialOffer: String
}
