//
//  ProductDetailContentViewModelTests.swift
//  JLPTechTestTests
//
//  Created by Tom Pearson on 01/10/2022.
//

import XCTest

@testable import JLPTechTest

@MainActor
final class ProductDetailContentViewModelTests: XCTestCase {
    
    private let productInformation = "<p>Super efficient, super quiet, and super handy when you're facing a mountain of washing up. Bosch has ensured the post-dinner clean up is a cinch courtesy of the clever features they've included in this dishwasher. The 60-minute quick cycle comes in super handy when you need plates in a jiffy, and the adjustable racking allows you to reconfigure the interior of the dishwasher to suit your load. You'll also love how eco-friendly it is. Sensors detect how dirty your dishes are and automatically adjusts the settings, so only the right amount of water and energy is used."
    
    func testPrice() {
        // Given
        let expectedPrice = "£399.00"
        let product = Product.stubbed(price: .stubbed(currency: "GBP", now: "399.00"))
        let sut = ProductDetailContentViewModel(product: product)
        
        // Then
        XCTAssertEqual(sut.price, expectedPrice)
    }
    
    func testPrice_WhenNonGBPCurrency_HasNoCurrencySymbol() {
        // Given
        let expectedPrice = "399.00"
        let product = Product.stubbed(price: .stubbed(currency: "USD", now: "399.00"))
        let sut = ProductDetailContentViewModel(product: product)
        
        // Then
        XCTAssertEqual(sut.price, expectedPrice)
    }
    
    func testIncludedServices() {
        // Given
        let expectedIncludedServices = ["2 year guarantee included"]
        let product = Product.stubbed(additionalServices: .stubbed(includedServices: expectedIncludedServices))
        let sut = ProductDetailContentViewModel(product: product)
        
        // Then
        XCTAssertEqual(sut.includedServices, expectedIncludedServices)
    }
    
    func testProductInformation_BeforeShowMorePressed() {
        // Given
        let product = Product.stubbed(details: .stubbed(productInformation: productInformation))
        let sut = ProductDetailContentViewModel(product: product)
        
        // Then
        XCTAssertEqual(sut.productInformationHTML, productInformation.truncated(length: sut.productInformationTruncationLength))
    }
    
    func testProductInformation_AfterShowMorePressed() {
        // Given
        let product = Product.stubbed(details: .stubbed(productInformation: productInformation))
        let sut = ProductDetailContentViewModel(product: product)
        
        // When
        sut.showMoreProductInformationPressed()
        
        // Then
        XCTAssertEqual(sut.productInformationHTML, productInformation)
    }
    
    func testProductCode() {
        // Given
        let expectedProductCode = "81736293"
        let product = Product.stubbed(code: expectedProductCode)
        let sut = ProductDetailContentViewModel(product: product)
        
        // Then
        XCTAssertEqual(sut.productCode, expectedProductCode)
    }
    
    func testProductSpecifications() {
        // Given
        let expectedSpecifications: [ProductDetailContentViewModel.Specification] = [
            .init(name: "Adjustable racking", values: ["Upper and Lower Basket"]),
            .init(name: "Smart Technology", values: [
                "Amazon Alexa Enabled",
                "Google Assistant Enabled",
                "Home Connect Enabled",
                "Via Manufacturer's App"
            ]),
            .init(name: "Delay Wash", values: ["Yes"]),
            .init(name: "Delicate Wash", values: ["Yes"]),
            .init(name: "Dimensions", values: ["H84.5 x W60 x D60cm"]),
            .init(name: "Drying Performance", values: ["A"]),
            .init(name: "Drying System", values: ["Heat Exchange"])
        ]
        
        let attributes = expectedSpecifications.map { specification in
            Product.Attribute(
                name: specification.name,
                value: specification.values[0],
                multivalued: specification.values.count > 1,
                values: specification.values.count > 1 ? specification.values : []
            )
        }
        let product = Product.stubbed(details: .stubbed(features: [.stubbed(attributes: attributes)]))
        let sut = ProductDetailContentViewModel(product: product)
        
        // Then
        XCTAssertEqual(sut.productSpecifications, expectedSpecifications)
    }
    
    func testImageURLs() {
        // Given
        let url = "//johnlewis.scene7.com/is/image/JohnLewis/240936325?"
        let product = Product.stubbed(media: .stubbed(images: .stubbed(urls: [url])))
        let sut = ProductDetailContentViewModel(product: product)
        
        // Then
        XCTAssertEqual(sut.imageURLs, [URL(string: "https:" + url)!])
    }
    
    func testImageURLs_DoesNotIncludeMalformedURLs() {
        // Given
        let url = "//johnlew   is.scene7.com/is/image/JohnLewis/240936325?"
        let product = Product.stubbed(media: .stubbed(images: .stubbed(urls: [url])))
        let sut = ProductDetailContentViewModel(product: product)
        
        // Then
        XCTAssert(sut.imageURLs.isEmpty)
    }
    
    func testSpecialOffer() {
        // Given
        let expectedSpecialOffer = "Half price installation available worth £45 (Apply promo code HALFINSTALL45 at checkout)"
        let product = Product.stubbed(displaySpecialOffer: expectedSpecialOffer)
        let sut = ProductDetailContentViewModel(product: product)
        
        // Then
        XCTAssertEqual(sut.specialOffer, expectedSpecialOffer)
    }
    
    func testSpecialOffer_WhenEmpty_IsNil() {
        // Given
        let product = Product.stubbed(displaySpecialOffer: "")
        let sut = ProductDetailContentViewModel(product: product)
        
        // Then
        XCTAssertNil(sut.specialOffer)
    }
}
