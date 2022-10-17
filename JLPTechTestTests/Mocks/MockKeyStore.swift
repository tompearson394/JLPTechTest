//
//  MockKeyStore.swift
//  JLPTechTestTests
//
//  Created by Tom Pearson on 01/10/2022.
//

import Foundation

@testable import JLPTechTest

final class MockKeyStore: KeyStoreProtocol {

    var returnedKey: String!
    func key(name: String) -> String {
        returnedKey
    }
}
