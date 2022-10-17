//
//  ProductsSearchViewModelTests.swift
//  JLPTechTestTests
//
//  Created by Tom Pearson on 01/10/2022.
//

import XCTest

@testable import JLPTechTest

@MainActor
final class ProductsSearchViewModelTests: XCTestCase {
    
    private var mockProductsStore: MockProductsStore!
    private var mockCoordinator: MockCoordinator!
    private var sut: ProductsSearchViewModel!

    override func setUp() {
        super.setUp()
        mockProductsStore = MockProductsStore()
        mockCoordinator = MockCoordinator()
        sut = ProductsSearchViewModel(productsStore: mockProductsStore, coordinator: mockCoordinator)
    }

    func testSuccessfullyLoadingProducts() async {
        // Given
        let expectedSearchProduct = ProductSearchResponse.SearchProduct.stubbed(title: "Bosch Serie 2 SMV2ITX18G Fully Integrated Dishwasher")
        mockProductsStore.searchProductsResult = ProductSearchResponse.stubbed(products: [expectedSearchProduct])
        
        // When
        await sut.loadProducts(keyword: "dishwasher")
        
        // Then
        guard case let .loaded(product) = sut.state else {
            XCTFail("State should be loaded")
            return
        }
        XCTAssertEqual(product.products, [expectedSearchProduct])
    }
    
    func testErrorOnLoadingProducts() async {
        // Given
        let expectedError = NSError(domain: "Custom Error", code: 321)
        mockProductsStore.searchProductsError = expectedError

        // When
        await sut.loadProducts(keyword: "dishwasher")
        
        // Then
        guard case let .error(error as NSError) = sut.state else {
            XCTFail("State should be error")
            return
        }
        
        XCTAssertEqual(error, expectedError)
    }
    
    func testTappingOnProduct_DisplaysProductWithCorrectID() {
        // Given
        let id = "123"
        
        // When
        sut.productTapped(withID: id)
        
        // Then
        XCTAssertEqual(mockCoordinator.displayedProductID, id)
    }

}
