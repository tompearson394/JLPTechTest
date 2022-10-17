//
//  KeyStore.swift
//  JLPTechTest
//
//  Created by Tom Pearson on 01/10/2022.
//

import Foundation

protocol KeyStoreProtocol {
    func key(name: String) -> String
}

final class KeyStore: KeyStoreProtocol {
    private let keys: NSDictionary
    
    init() {
        guard let filePath = Bundle.main.path(forResource: "Keys", ofType: "plist"),
                let plist = NSDictionary(contentsOfFile: filePath) else {
            fatalError("No Keys.plist file")
        }
        keys = plist
    }
    
    func key(name: String) -> String {
        guard let key = keys.object(forKey: name) as? String else {
            fatalError("\(name) key has not been configured")
        }
        return key
    }
}
