//
//  ViewState.swift
//  JLPTechTest
//
//  Created by Tom Pearson on 30/09/2022.
//

import Foundation

enum ViewState<T> {
    case loading
    case loaded(data: T)
    case error(error: Error)
}
