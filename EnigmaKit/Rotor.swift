//
//  Rotor.swift
//  EnigmaKit
//
//  Created by Prebeg, Ivor on 02/12/2016.
//  Copyright © 2016 Prebeg, Ivor. All rights reserved.
//

import Foundation

class Rotor {
    
    var idx:Int = 0
    var rotor:Array<Character>
    private(set) var carry:Bool = false
    
    init(rotorInit:String) {
        rotor = Array(rotorInit.characters)
    }
    
    func read() -> (Character) {
        return rotor[idx]
    }
    
    func rotate() {
        idx += 1
        idx %= rotor.count
        if (idx == 0) { carry = true } else { carry = false }
    }
    
    func readAndRotate() -> (Character) {
        let ch = read()
        rotate()
        return ch
    }
}
