//
//  Coordinator.swift
//  JLPTechTest
//
//  Created by Tom Pearson on 17/10/2022.
//

import SwiftUI

@MainActor
protocol CoordinatorProtocol {
    func displayProduct(withID id: String)
}

@MainActor
final class Coordinator: CoordinatorProtocol, ObservableObject {
    @Published var path = NavigationPath()
    
    @ViewBuilder
    func viewForScreen(_ screen: Screen) -> some View {
        switch screen {
        case .dishwashers:
            let viewModel = ProductsSearchViewModel(coordinator: self)
            ProductsSearchView(viewModel: viewModel)
        case .product(let id):
            let viewModel = ProductDetailViewModel(productId: id)
            ProductDetailView(viewModel: viewModel)
        }
    }

    func displayProduct(withID id: String) {
        path.append(Screen.product(id: id))
    }
    
    
    func makeInitialView() -> some View {
        viewForScreen(.dishwashers)
    }
}
