//
//  ProductsSearchView.swift
//  JLPTechTest
//
//  Created by Tom Pearson on 30/09/2022.
//

import SwiftUI

struct ProductsSearchView: View {
    
    @Environment(\.horizontalSizeClass) private var sizeClass
    
    let columns = [
        GridItem(.adaptive(minimum: 170), spacing: 1)
    ]
    
    @StateObject var viewModel: ProductsSearchViewModel
    
    var body: some View {
        LoadableView(
            state: viewModel.state,
            load: { await viewModel.loadProducts(keyword: "dishwasher") },
            content: { productSearchResponse in
                ScrollView {
                    ZStack {
                        Color(.systemGray4)
                        
                        LazyVGrid(columns: columns, spacing: 1) {
                            ForEach(productSearchResponse.products) { searchProduct in
                                Button {
                                    viewModel.productTapped(withID: searchProduct.id)
                                } label: {
                                    let productViewModel = SearchProductViewModel(searchProduct: searchProduct)
                                    SearchProductView(viewModel: productViewModel)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                                        .background {
                                            Color(.systemBackground)
                                        }
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding(.vertical, 1)
                    }
                }
                .navigationTitle("Dishwashers (\(productSearchResponse.results))")
            }
        )
        .navigationTitle(Text("Dishwashers"))
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ProductsSearchViewModel(coordinator: Coordinator())
        ProductsSearchView(viewModel: viewModel)
        
        ProductsSearchView(viewModel: viewModel)
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
