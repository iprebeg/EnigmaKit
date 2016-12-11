//
//  Plugboard.swift
//  EnigmaKit
//
//  Created by Prebeg, Ivor on 02/12/2016.
//  Copyright © 2016 Prebeg, Ivor. All rights reserved.
//

import Foundation

class Plugboard : ReversibleSignalHandler {
    
    var mapper:AlphaMapper
    
    init(plugboard:String) {
        mapper = AlphaMapper(alphaStatic: Constants.ALPHABET, alphaRot:plugboard)
    }
    
    init(plugboard:Dictionary<Character, Character>) {
        var s:String = Constants.ALPHABET;
        for (k,v) in plugboard {
            let ki = s.range(of: String(k))!
            let vi = s.range(of: String(v))!
            s.replaceSubrange(ki, with: String(v))
            s.replaceSubrange(vi, with: String(k))
        }
        mapper = AlphaMapper(alphaStatic: Constants.ALPHABET, alphaRot:s)
    }
    
    func signal(c: Character) -> (Character) {
        return mapper.map(c: c)
    }
    
    func signalReverse(c: Character) -> (Character) {
        return mapper.maprev(c: c)
    }
    
    static func NONE() -> (Plugboard) {
        return Plugboard(plugboard: Constants.ALPHABET)
    }
}
