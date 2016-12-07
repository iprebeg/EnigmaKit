//
//  Rotor.swift
//  EnigmaKit
//
//  Created by Prebeg, Ivor on 02/12/2016.
//  Copyright © 2016 Prebeg, Ivor. All rights reserved.
//

import Foundation

class Rotor : ReversibleSignalHandler  {
    
    private var alphaMapper:AlphaMapper
    
    private var offset:Int
    private var setting:Int
    private var notches:Array<Character>
    private(set) var carry:Bool = false
    
    private var length:Int!
    
    init(rotor:String, offset:Character = "A", setting:Character = "A", notches:Array<Character>) {
        alphaMapper = AlphaMapper(alphaStatic: Constants.ALPHABET, alphaRot: rotor)
        self.offset = offset.alphaIndex
        self.setting = setting.alphaIndex
        self.length = rotor.characters.count
        self.notches = notches//.map{$0.add(val: 1, alphaSize: rotor.characters.count)}
    }
    
    func setOffset(offset:Character) {
        self.offset = offset.alphaIndex % length
    }

    func setSetting(setting:Character) {
        self.setting = setting.alphaIndex % length
    }
    
    func read() -> (Character) {
        return alphaMapper.read(at: offset)
    }
    
    func rotate() {

        offset += 1
        offset %= length
        
        //if (offset == 0) { carry = true } else { carry = false }
        if (notches.contains(alphaMapper.read(at: offset).sub(val: 0, alphaSize: 26)) ) {
            carry = true
        } else {
            carry = false
        }
        

    }
    
    func signal(c: Character) -> (Character) {
        let r = Character.fromAlphaIndex(idx: (alphaMapper.map(c: Character.fromAlphaIndex(idx:(c.alphaIndex + offset) % length), offset: setting).alphaIndex - offset + length) % length)
        //print("Rotor> " + String(c) + " -> " + String(r))
        return r
    }
    
    func signalReverse(c: Character) -> (Character) {
        let r = Character.fromAlphaIndex(idx: (alphaMapper.maprev(c: Character.fromAlphaIndex(idx: (c.alphaIndex + offset) % length), offset: setting).alphaIndex - offset + length) % length)
        //print("Rotor< " + String(c) + " -> " + String(r))
        return r
    }
    
    static func ROTOR_I() -> (Rotor) {
        return Rotor(rotor: Constants.ROTOR_I, notches: Array(arrayLiteral: "Q"))
    }
    
    static func ROTOR_II() -> (Rotor) {
        return Rotor(rotor: Constants.ROTOR_II, notches: Array(arrayLiteral: "E"))
    }
    
    static func ROTOR_III() -> (Rotor) {
        return Rotor(rotor: Constants.ROTOR_III, notches: Array(arrayLiteral: "V"))
    }
    
    static func ROTOR_IV() -> (Rotor) {
        return Rotor(rotor: Constants.ROTOR_IV, notches: Array(arrayLiteral: "J"))
    }
    
    static func ROTOR_V() -> (Rotor) {
        return Rotor(rotor: Constants.ROTOR_V, notches: Array(arrayLiteral: "Z"))
    }
    
    static func ROTOR_VI() -> (Rotor) {
        return Rotor(rotor: Constants.ROTOR_VI, notches: Array(arrayLiteral: "Z", "M"))
    }
    
    static func ROTOR_VII() -> (Rotor) {
        return Rotor(rotor: Constants.ROTOR_VII, notches: Array(arrayLiteral: "Z", "M"))
    }
    
    static func ROTOR_VIII() -> (Rotor) {
        return Rotor(rotor: Constants.ROTOR_VIII, notches: Array(arrayLiteral: "Z", "M"))
    }
    
    static func ROTOR_BETA() -> (Rotor) {
        return Rotor(rotor: Constants.ROTOR_BETA, notches: Array(arrayLiteral: "Z", "M"))
    }
    
    static func ROTOR_GAMMA() -> (Rotor) {
        return Rotor(rotor: Constants.ROTOR_GAMMA, notches: Array(arrayLiteral: "Z", "M"))
    }
}
