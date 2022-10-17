//
//  ProductsSearchViewModel.swift
//  JLPTechTest
//
//  Created by Tom Pearson on 01/10/2022.
//

import Foundation

@MainActor
final class ProductsSearchViewModel: ObservableObject {
    @Published var state: ViewState<ProductSearchResponse> = .loading
    
    private let productsStore: ProductsStoreProcotol
    private let coordinator: CoordinatorProtocol
    
    init(productsStore: ProductsStoreProcotol = Stores.shared.productsStore, coordinator: CoordinatorProtocol) {
        self.productsStore = productsStore
        self.coordinator = coordinator
    }
    
    func loadProducts(keyword: String) async {
        state = .loading
        do {
            let response = try await productsStore.searchProducts(keyword: keyword)
            state = .loaded(data: response)
        } catch {
            state = .error(error: error)
        }
    }
    
    func productTapped(withID id: String) {
        coordinator.displayProduct(withID: id)
    }
}
