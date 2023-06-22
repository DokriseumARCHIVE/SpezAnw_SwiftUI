//
//  AlphabetPW.swift
//  SpezAnwUebung
//
//  Created by Dustin on 22.06.23.
//

import Foundation
@propertyWrapper
struct LatinAlphabet {
    private var value: Int = 1
    
    var wrappedValue: Int {
        get { value }
        set { value = ((newValue - 1) % 26 + 26) % 26 + 1 }
    }
    
    init(wrappedValue: Int) {
        self.wrappedValue = wrappedValue
    }
}
