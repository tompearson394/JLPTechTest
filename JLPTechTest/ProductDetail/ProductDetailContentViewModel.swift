//
//  ProductDetailContentViewModel.swift
//  JLPTechTest
//
//  Created by Tom Pearson on 01/10/2022.
//

import Foundation

@MainActor
final class ProductDetailContentViewModel: ObservableObject {
    
    struct Specification: Equatable, Identifiable {
        let name: String
        let values: [String]
        
        var id: String {
            name // assumes names are unique
        }
    }
    
    let productInformationTruncationLength = 200
    @Published private(set) var displayShowMoreButton: Bool
    @Published private(set) var productInformationHTML: String
    
    private let product: Product
    
    init(product: Product) {
        self.product = product
        let infoHTML = product.details.productInformation.truncated(length: productInformationTruncationLength)
        self.productInformationHTML = infoHTML
        self.displayShowMoreButton = infoHTML.count > productInformationTruncationLength
    }
    
    var title: String {
        product.title
    }
    
    var imageURLs: [URL] {
        product.media.images.urls.compactMap { URL(string: "https:" + $0) }
    }
    
    var price: String {
        guard product.price.currency == "GBP" else {
            return product.price.now
        }
        return "£" + product.price.now
    }
    
    var includedServices: [String] {
        product.additionalServices.includedServices
    }
    
    var specialOffer: String? {
        product.displaySpecialOffer.isEmpty ? nil : product.displaySpecialOffer
    }
    
    var productCode: String {
        product.code
    }

    var productSpecifications: [Specification] {
        product.details.features.flatMap { feature in
            feature.attributes.map { attribute in
                Specification(
                    name: attribute.name,
                    values: attribute.multivalued ? attribute.values : [attribute.value]
                )
            }
        }
    }
    
    func showMoreProductInformationPressed() {
        displayShowMoreButton = false
        productInformationHTML = product.details.productInformation
    }
}
