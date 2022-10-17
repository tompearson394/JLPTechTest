//
//  MockProductStore.swift
//  JLPTechTestTests
//
//  Created by Tom Pearson on 01/10/2022.
//

import Foundation

@testable import JLPTechTest

final class MockProductsStore: ProductsStoreProcotol {
    var searchProductsResult: ProductSearchResponse!
    var searchProductsError: Error?
    
    var fetchProductResult: Product!
    var fetchProductError: Error?
    
    func searchProducts(keyword: String) async throws -> ProductSearchResponse {
        if let error = searchProductsError {
            throw error
        }
        return searchProductsResult
    }
    
    func fetchProduct(_ id: String) async throws -> Product {
        if let error = fetchProductError {
            throw error
        }
        return fetchProductResult
    }
}
