//
//  ExtString.swift
//  Kasir
//
//  Created by Ferry jati on 11/09/24.
//

import Foundation

extension String {
    
    func trim(_ characterSet: CharacterSet) -> String {
            return self.trimmingCharacters(in: characterSet)
    }
}
