//
//  ProductStub.swift
//  JLPTechTestTests
//
//  Created by Tom Pearson on 01/10/2022.
//

import Foundation

@testable import JLPTechTest

extension Product {
    static func stubbed(
        price: Price = .stubbed(),
        media: Media = .stubbed(),
        details: Details = .stubbed(),
        title: String = "",
        additionalServices: AdditionalServices = .stubbed(),
        code: String = "",
        displaySpecialOffer: String = ""
    ) -> Self {
        self.init(
            price: price,
            media: media,
            details: details,
            title: title,
            additionalServices: additionalServices,
            code: code,
            displaySpecialOffer: displaySpecialOffer
        )
    }
}

extension Product.AdditionalServices {
    static func stubbed(includedServices: [String] = []) -> Self {
        self.init(includedServices: includedServices)
    }
}

extension Product.Details {
    static func stubbed(productInformation: String = "", features: [Product.Feature] = []) -> Self {
        self.init(productInformation: productInformation, features: features)
    }
}

extension Product.Feature {
    static func stubbed(attributes: [Product.Attribute] = []) -> Self {
        self.init(attributes: attributes)
    }
}

extension Product.Attribute {
    static func stubbed(name: String = "", value: String = "", multivalued: Bool = false, values: [String] = []) -> Self {
        self.init(
            name: name,
            value: value,
            multivalued: multivalued,
            values: []
        )
    }
}

extension Product.Media {
    static func stubbed(images: Product.Images = .stubbed()) -> Self {
        self.init(images: images)
    }
}

extension Product.Images {
    static func stubbed(urls: [String] = []) -> Self {
        self.init(urls: urls)
    }
}

extension Product.Price {
    static func stubbed(currency: String = "", now: String = "") -> Self {
        self.init(currency: currency, now: now)
    }
}
