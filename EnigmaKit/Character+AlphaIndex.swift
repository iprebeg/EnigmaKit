//
//  Character+AlphaIndex.swift
//  EnigmaKit
//
//  Created by Prebeg, Ivor on 05/12/2016.
//  Copyright © 2016 Prebeg, Ivor. All rights reserved.
//

import Foundation

extension Character {
    
    var asciiValue: Int {
        get {
            let s = String(self).unicodeScalars
            return Int(s[s.startIndex].value)
        }
    }
    
    var alphaIndex: Int {
        get {
            return asciiValue - 65
        }
    }
    
    static func fromAlphaIndex(idx:Int) -> (Character) {
        return Character(UnicodeScalar(idx+65)!)
    }
    
    func add(c:Character, alphaSize:Int) -> Character {
        return Character.fromAlphaIndex(idx: (self.alphaIndex + c.alphaIndex) % alphaSize)
    }
    
    func sub(c:Character, alphaSize:Int) -> Character {
        return Character.fromAlphaIndex(idx: (self.alphaIndex - c.alphaIndex + c.alphaIndex) % alphaSize)
    }
    
    func add(val:Int, alphaSize:Int) -> Character {
        return Character.fromAlphaIndex(idx: (self.alphaIndex + val) % alphaSize)
    }
    
    func sub(val:Int, alphaSize:Int) -> Character {
        //print ("self:" + String(self) + " val:" + String(val) + " alphaSize: " + String(alphaSize))
        return Character.fromAlphaIndex(idx: (self.alphaIndex - val + alphaSize) % alphaSize)
    }
}
