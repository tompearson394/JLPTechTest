//
//  ProductDetailView.swift
//  JLPTechTest
//
//  Created by Tom Pearson on 01/10/2022.
//

import SwiftUI

struct ProductDetailView: View {
    
    @StateObject var viewModel: ProductDetailViewModel
    
    var body: some View {
        LoadableView(
            state: viewModel.state,
            load: { await viewModel.loadProduct() },
            content: { product in
                let viewModel = ProductDetailContentViewModel(product: product)
                ProductDetailContentView(viewModel: viewModel)
            }
        )
    }
}
