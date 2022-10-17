//
//  String+Truncated.swift
//  JLPTechTest
//
//  Created by Tom Pearson on 01/10/2022.
//

import Foundation

extension String {
  func truncated(length: Int, trailing: String = "…") -> String {
    return (self.count > length) ? self.prefix(length) + trailing : self
  }
}
