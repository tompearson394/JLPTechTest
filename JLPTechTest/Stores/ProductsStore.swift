//
//  ProductsStore.swift
//  JLPTechTest
//
//  Created by Tom Pearson on 30/09/2022.
//

import Foundation

protocol ProductsStoreProcotol {
    func searchProducts(keyword: String) async throws -> ProductSearchResponse
    func fetchProduct(_ id: String) async throws -> Product
}

final class ProductsStore: ProductsStoreProcotol {
    
    enum ProductStoreError: LocalizedError {
        case badURL
        case searchKeywordEncoding
        
        var errorDescription: String? {
            switch self {
            case .badURL:
                return "URL was not constructed correctly"
            case .searchKeywordEncoding:
                return "Couldn't encode the search keyword"
            }
        }
    }
    
    private let baseAPI = "https://api.johnlewis.com"
    private let decoder = JSONDecoder()
    private let network: Network
    private let apiKey: String
    
    init(network: Network = URLSession.shared, keyStore: KeyStoreProtocol = KeyStore()) {
        self.network = network
        self.apiKey = keyStore.key(name: "API_KEY")
    }
    
    func searchProducts(keyword: String) async throws -> ProductSearchResponse {
        guard let encodedKeyword = keyword.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
            throw ProductStoreError.searchKeywordEncoding
        }
        
        guard let url = URL(string: "\(baseAPI)/search/api/rest/v2/catalog/products/search/keyword?q=\(encodedKeyword)&key=\(apiKey)") else {
            throw ProductStoreError.badURL
        }
        
        return try await fetchResource(fromURL: url)
    }
    
    func fetchProduct(_ id: String) async throws -> Product {
        guard let url = URL(string: "\(baseAPI)/mobile-apps/api/v1/products/\(id)") else {
            throw ProductStoreError.badURL
        }
        
        return try await fetchResource(fromURL: url)
    }
    
    private func fetchResource<T: Decodable>(fromURL url: URL) async throws -> T {
        let (data, _) = try await network.data(from: url)
        return try decoder.decode(T.self, from: data)
    }
}
