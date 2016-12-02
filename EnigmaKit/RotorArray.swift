//
//  RotorArray.swift
//  EnigmaKit
//
//  Created by Prebeg, Ivor on 02/12/2016.
//  Copyright © 2016 Prebeg, Ivor. All rights reserved.
//

import Foundation

class RotorArray {
    
    var rotors:Array<Rotor>
    
    init(rotorsInit:Array<Rotor>) {
        rotors = rotorsInit
    }
    
    func read() -> String {
        return String(rotors.map{$0.read()})
    }
    
    func rotate() {
        /*
        var rotate:Bool = true
        for r in rotors.reversed() {
            
            if (rotate) {
                r.rotate()
                rotate = r.carry
            }
        }
        */
        
        _ = rotors.reversed().reduce(true) { if ($0) { $1.rotate(); return $1.carry} else { return false}}
    }
    
    func readAndRotate() -> String {
        let r:String = read()
        rotate()
        return r
    }
}
