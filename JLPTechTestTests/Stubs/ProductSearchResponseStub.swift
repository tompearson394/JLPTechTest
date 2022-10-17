//
//  ProductSearchResponseStub.swift
//  JLPTechTestTests
//
//  Created by Tom Pearson on 01/10/2022.
//

import Foundation

@testable import JLPTechTest

extension ProductSearchResponse {
    static func stubbed(products: [SearchProduct] = [], results: Int = 0) -> Self {
        self.init(products: products, results: results)
    }
}

extension ProductSearchResponse.SearchProduct {
    static func stubbed(
        productId: String = "",
        title: String = "",
        image: String = "",
        variantPriceRange: ProductSearchResponse.VariantPriceRange = .stubbed()
    ) -> Self {
        self.init(
            productId: productId,
            title: title,
            image: image,
            variantPriceRange: variantPriceRange
        )
    }
}

extension ProductSearchResponse.VariantPriceRange {
    static func stubbed(display: PriceRange = .stubbed(), value: PriceRange = .stubbed()) -> Self {
        self.init(display: display, value: value)
    }
}

extension ProductSearchResponse.VariantPriceRange.PriceRange {
    static func stubbed(max: String = "", min: String = "") -> Self {
        self.init(max: max, min: min)
    }
}
