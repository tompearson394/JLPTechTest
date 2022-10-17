//
//  SearchProductViewModelTests.swift
//  JLPTechTestTests
//
//  Created by Tom Pearson on 01/10/2022.
//

import XCTest

@testable import JLPTechTest

final class SearchProductViewModelTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    func testTitle() {
        // Given
        let expectedTitle = "Bosch Serie 2 SMV2ITX18G Fully Integrated Dishwasher"
        let searchProduct = ProductSearchResponse.SearchProduct.stubbed(title: expectedTitle)
        let sut = SearchProductViewModel(searchProduct: searchProduct)
        
        // Then
        XCTAssertEqual(sut.title, expectedTitle)
    }
    
    func testPrice() {
        // Given
        let expectedPrice = "123.00"
        let searchProduct = ProductSearchResponse.SearchProduct.stubbed(variantPriceRange: .stubbed(display: .stubbed(max: expectedPrice, min: "456.00")))
        let sut = SearchProductViewModel(searchProduct: searchProduct)
        
        // Then
        XCTAssertEqual(sut.price, expectedPrice)
    }
    
    func testImageURL() {
        // Given
        let url = "//johnlewis.scene7.com/is/image/JohnLewis/240936325?"
        let searchProduct = ProductSearchResponse.SearchProduct.stubbed(image: url)
        let sut = SearchProductViewModel(searchProduct: searchProduct)
        
        // Then
        XCTAssertEqual(sut.imageURL, URL(string: "https:" + url))
    }
    
    func testImageURL_WhenURLIsMalformed_IsNil() {
        // Given
        let url = "//johnlewi   s.scene7.com/is/image/JohnLewis/240936325?"
        let searchProduct = ProductSearchResponse.SearchProduct.stubbed(image: url)
        let sut = SearchProductViewModel(searchProduct: searchProduct)
        
        // Then
        XCTAssertNil(sut.imageURL)
    }

}
