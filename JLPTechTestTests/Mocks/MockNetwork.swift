//
//  MockNetwork.swift
//  JLPTechTestTests
//
//  Created by Tom Pearson on 01/10/2022.
//

import Foundation

@testable import JLPTechTest

final class MockNetwork: Network {
    
    var returnedData: Data!
    var returnedURLResponse: URLResponse!
    var error: Error?
    
    func data(from: URL) async throws -> (Data, URLResponse) {
        if let error {
            throw error
        }
        return (returnedData, returnedURLResponse)
    }
}
