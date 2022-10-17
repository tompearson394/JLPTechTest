//
//  Stores.swift
//  JLPTechTest
//
//  Created by Tom Pearson on 01/10/2022.
//

import Foundation

final class Stores {
    static let shared = Stores()
    private init() {}
    
    let productsStore = ProductsStore()
}
