//
//  ProductDetailViewModel.swift
//  JLPTechTest
//
//  Created by Tom Pearson on 01/10/2022.
//

import Foundation

@MainActor
final class ProductDetailViewModel: ObservableObject {
    
    @Published private(set) var state: ViewState<Product> = .loading
    
    private let productId: String
    private let productsStore: ProductsStoreProcotol
    
    init(productId: String, productsStore: ProductsStoreProcotol = Stores.shared.productsStore) {
        self.productId = productId
        self.productsStore = productsStore
    }
    
    func loadProduct() async {
        state = .loading
        
        do {
            let product = try await productsStore.fetchProduct(productId)
            state = .loaded(data: product)
        } catch {
            state = .error(error: error)
        }
    }
}
