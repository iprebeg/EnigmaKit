//
//  Reflector.swift
//  EnigmaKit
//
//  Created by Prebeg, Ivor on 02/12/2016.
//  Copyright © 2016 Prebeg, Ivor. All rights reserved.
//

import Foundation

class Reflector : SignalHandler {
    
    private var mapper:AlphaMapper
    
    init(reflector:String) {
        self.mapper = AlphaMapper(alphaStatic: Constants.ALPHABET, alphaRot:reflector)
    }
    
    func signal(c: Character) -> (Character) {
        let r = mapper.map(c: c)
        //print("REF> " + String(c) + " -> " + String(r))
        return r
    }

    static func REFLECTOR_A() -> (Reflector) {
        return Reflector(reflector: Constants.REFLECTOR_A)
    }
    
    static func REFLECTOR_B() -> (Reflector) {
        return Reflector(reflector: Constants.REFLECTOR_B)
    }
    
    static func REFLECTOR_C() -> (Reflector) {
        return Reflector(reflector: Constants.REFLECTOR_C)
    }
    
    static func REFLECTOR_B_THIN() -> (Reflector) {
        return Reflector(reflector: Constants.REFLECTOR_B_THIN)
    }
    
    static func REFLECTOR_C_THIN() -> (Reflector) {
        return Reflector(reflector: Constants.REFLECTOR_C_THIN)
    }
}
