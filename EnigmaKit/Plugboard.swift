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
