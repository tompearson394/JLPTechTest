//
//  Fonts.swift
//  JLPTechTest
//
//  Created by Tom Pearson on 30/09/2022.
//

import SwiftUI

extension Font {
    static let jlpTitle  = Font.custom("Gill Sans", size: 30.0, relativeTo: .title)
    static let jlpTitle2  = Font.custom("Gill Sans", size: 25.0, relativeTo: .title2)
    static let jlpTitle3  = Font.custom("Gill Sans", size: 20.0, relativeTo: .title3)
    static let jlpBody = Font.custom("Gill Sans", size: 18.0, relativeTo: .body)
}

extension UIFont {
    static let jlpLargeNavigationBarTitleFont = UIFont(name: "Gill Sans", size: 30)!
    static let jlpNavigationBarTitleFont = UIFont(name: "Gill Sans", size: 20)!
}
