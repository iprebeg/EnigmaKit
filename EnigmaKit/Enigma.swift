//
//  Enigma.swift
//  EnigmaKit
//
//  Created by Prebeg, Ivor on 02/12/2016.
//  Copyright © 2016 Prebeg, Ivor. All rights reserved.
//

import Foundation

class Enigma : Encryptor,Substitutor {
    
    func encrypt(src: String) -> (String) {
        return String(src.characters.map{encrypt(c: $0)})
    }
    
    func encrypt(c: Character) -> (Character) {
        return "A"
    }
}
