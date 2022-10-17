//
//  SearchProductViewModel.swift
//  JLPTechTest
//
//  Created by Tom Pearson on 01/10/2022.
//

import Foundation

protocol SearchProductViewModelProtocol {
    var imageURL: URL? { get }
    var title: String { get }
    var price: String { get }
}

struct SearchProductViewModel: SearchProductViewModelProtocol {
    private let searchProduct: ProductSearchResponse.SearchProduct
    
    init(searchProduct: ProductSearchResponse.SearchProduct) {
        self.searchProduct = searchProduct
    }
    
    var imageURL: URL? {
        URL(string: "https:" + searchProduct.image)
    }
    
    var title: String {
        searchProduct.title
    }
    
    var price: String {
        searchProduct.variantPriceRange.display.max
    }
}
