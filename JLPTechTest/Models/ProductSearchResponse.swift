//
//  ProductSearchResponse.swift
//  JLPTechTest
//
//  Created by Tom Pearson on 01/10/2022.
//

import Foundation

struct ProductSearchResponse: Codable {
    
    struct VariantPriceRange: Codable, Equatable {
        struct PriceRange: Codable, Equatable {
            let max, min: String
        }
        
        let display: PriceRange
        let value: PriceRange
    }
    
    struct SearchProduct: Codable, Equatable, Identifiable {
        let productId: String
        let title: String
        let image: String
        let variantPriceRange: VariantPriceRange
        
        var id: String { productId }
    }
    
    let products: [SearchProduct]
    let results: Int
}
