//
//  ProductsStoreTests.swift
//  JLPTechTestTests
//
//  Created by Tom Pearson on 01/10/2022.
//

import XCTest

@testable import JLPTechTest

final class ProductsStoreTests: XCTestCase {
    
    private var jsonEncoder: JSONEncoder!
    private var network: MockNetwork!
    private var keyStore: MockKeyStore!
    private var sut: ProductsStore!
    
    override func setUp() {
        super.setUp()
        jsonEncoder = JSONEncoder()
        network = MockNetwork()
        keyStore = MockKeyStore()
        keyStore.returnedKey = "api_key"
        sut = ProductsStore(network: network, keyStore: keyStore)
        
    }
    
    func testFetchProductSearchResponse() async throws {
        // Given
        network.returnedURLResponse = URLResponse()
        
        let expectedSearchResponse = ProductSearchResponse.stubbed(
            products: [
                ProductSearchResponse.SearchProduct.stubbed(
                    productId: "5561997",
                    title: "Bosch Serie 2 SMV2ITX18G Fully Integrated Dishwasher",
                    image: "//johnlewis.scene7.com/is/image/JohnLewis/239968647?",
                    variantPriceRange: .stubbed(
                        display: .stubbed(max: "£449.00", min: "£449.00"),
                        value: .stubbed(max: "£449.00", min: "£449.00")
                    )
                )
            ]
        )
        
        network.returnedData = try jsonEncoder.encode(expectedSearchResponse)
        
        // When
        let response = try await sut.searchProducts(keyword: "dishwashers")
        
        // Then
        XCTAssertEqual(response.products, expectedSearchResponse.products)
    }
    
    func testFetchProduct() async throws {
        // Given
        network.returnedURLResponse = URLResponse()
        
        let expectedProduct = Product.stubbed(title: "Bosch Serie 2 SMV2ITX18G Fully Integrated Dishwasher")
        
        network.returnedData = try jsonEncoder.encode(expectedProduct)
        
        // When
        let product = try await sut.fetchProduct("5561997")
        
        // Then
        XCTAssertEqual(product, expectedProduct)
    }
    
    func testFetchingProductSearchResponse_OnNetworkError_PropagatesError() async {
        // Given
        let expectedError = NSError(domain: "domain", code: 321)
        network.error = expectedError
        
        // When
        do {
            _ = try await sut.searchProducts(keyword: "dishwashers")
            XCTFail("An error should have been thrown")
        } catch {
            XCTAssertEqual(error as NSError, expectedError)
        }
    }
    
    func testFetchingProduct_OnNetworkError_PropagatesError() async {
        // Given
        let expectedError = NSError(domain: "domain", code: 321)
        network.error = expectedError
        
        // When
        do {
            _ = try await sut.fetchProduct("5561997")
            XCTFail("An error should have been thrown")
        } catch {
            XCTAssertEqual(error as NSError, expectedError)
        }
    }
    
    func testInvalidStringEncoding() async {
        let invalidString = String(
            bytes: [0xD8, 0x00] as [UInt8],
            encoding: .utf16BigEndian
        )!
        
        do {
            _ = try await sut.searchProducts(keyword: invalidString)
            XCTFail("An error should have been thrown")
        } catch {
            guard case ProductsStore.ProductStoreError.searchKeywordEncoding = error else {
                XCTFail("Error should have been searchKeywordEncoding")
                return
            }
        }
    }
}
