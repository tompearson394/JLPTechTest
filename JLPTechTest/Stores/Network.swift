//
//  Network.swift
//  JLPTechTest
//
//  Created by Tom Pearson on 01/10/2022.
//

import Foundation

protocol Network {
    func data(from: URL) async throws -> (Data, URLResponse)
}

extension URLSession: Network {}
