//
//  MockCoordinator.swift
//  JLPTechTestTests
//
//  Created by Tom Pearson on 17/10/2022.
//

import Foundation

@testable import JLPTechTest

final class MockCoordinator: CoordinatorProtocol {

    var displayedProductID: String?
    func displayProduct(withID id: String) {
        displayedProductID = id
    }
}
