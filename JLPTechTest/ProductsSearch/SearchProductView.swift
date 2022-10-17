//
//  SearchProductView.swift
//  JLPTechTest
//
//  Created by Tom Pearson on 30/09/2022.
//

import SwiftUI
import NukeUI

struct SearchProductView<ViewModel: SearchProductViewModelProtocol>: View {
    let viewModel: ViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            LazyImage(url: viewModel.imageURL, resizingMode: .aspectFit)
                .frame(height: 170)
            
            VStack(alignment: .leading) {
                Text(viewModel.title)
                    .multilineTextAlignment(.leading)
                Text(viewModel.price)
                    .fontWeight(.bold)
            }
        }
        .padding()
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {        
        struct MockProductViewModel: SearchProductViewModelProtocol {
            let imageURL = URL(string: "https://johnlewis.scene7.com/is/image/JohnLewis/239968647?")
            let title = "Bosch Serie 2 SMV2ITX18G Fully Integrated Dishwasher"
            let price = "£449.00"
        }
        
        return SearchProductView(viewModel: MockProductViewModel())
    }
}
