//
//  Enigma.swift
//  EnigmaKit
//
//  Created by Prebeg, Ivor on 02/12/2016.
//  Copyright © 2016 Prebeg, Ivor. All rights reserved.
//

import Foundation

class Enigma : SignalHandler {
    
    var rotorArray:RotorArray
    var reflector:Reflector
    var plugboard:Plugboard
    
    init(rotorArray:RotorArray, reflector:Reflector, plugboard:Plugboard) {
        self.rotorArray = rotorArray
        self.reflector = reflector
        self.plugboard = plugboard
    }
    
    func signal(c: Character) -> (Character) {
        
        rotorArray.rotate()

        var r = Array<SignalHandler>(arrayLiteral:
            plugboard, rotorArray, reflector).reduce(c){ $1.signal(c: $0)}
        r = Array<ReversibleSignalHandler>(arrayLiteral:
            plugboard, rotorArray).reversed().reduce(r){ $1.signalReverse(c:$0)}
            
        return r
    }
    
    func encrypt(s:String) -> (String) {
        return String(s.characters.map{self.signal(c: $0)})
    }
    
    func setOffsets(s:String) {
        rotorArray.setOffsets(s: Array(s.characters))
    }
    
    func setSettings(s:String) {
        rotorArray.setSettings(s: Array(s.characters))
    }
    
    static func M3() -> (Enigma) {
        return Enigma(
            rotorArray:RotorArray(rotorsInit: Array(arrayLiteral:
                Rotor.ROTOR_I(),
                Rotor.ROTOR_II(),
                Rotor.ROTOR_III()
            )),
            reflector:Reflector.REFLECTOR_B(),
            plugboard:Plugboard.NONE())
    }
}

struct Constants {
    
    static let ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    
    static let ROTOR_I = "EKMFLGDQVZNTOWYHXUSPAIBRCJ";
    static let ROTOR_II = "AJDKSIRUXBLHWTMCQGZNPYFVOE";
    static let ROTOR_III = "BDFHJLCPRTXVZNYEIWGAKMUSQO";
    static let ROTOR_IV = "ESOVPZJAYQUIRHXLNFTGKDCMWB";
    static let ROTOR_V = "VZBRGITYUPSDNHLXAWMJQOFECK";
    static let ROTOR_VI = "JPGVOUMFYQBENHZRDKASXLICTW";
    static let ROTOR_VII = "NZJHGRCXMYSWBOUFAIVLPEKQDT";
    static let ROTOR_VIII = "FKQHTLXOCBJSPDZRAMEWNIUYGV";
    
    static let ROTOR_BETA = "LEYJVCNIXWPBQMDRTAKZGFUHOS";
    static let ROTOR_GAMMA = "FSOKANUERHMBTIYCWLQPZXVGJD";
    
    static let REFLECTOR_A = "EJMZALYXVBWFCRQUONTSPIKHGD";
    static let REFLECTOR_B = "YRUHQSLDPXNGOKMIEBFZCWVJAT";
    static let REFLECTOR_C = "FVPJIAOYEDRZXWGCTKUQSBNMHL";
    static let REFLECTOR_B_THIN = "ENKQAUYWJICOPBLMDXZVFTHRGS";
    static let REFLECTOR_C_THIN = "RDOBJNTKVEHMLFCWZAXGYIPSUQ";
    
    static let EKW = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

}

