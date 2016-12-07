//
//  RotorArray.swift
//  EnigmaKit
//
//  Created by Prebeg, Ivor on 02/12/2016.
//  Copyright © 2016 Prebeg, Ivor. All rights reserved.
//

import Foundation

class RotorArray : ReversibleSignalHandler {
    
    var rotors:Array<Rotor>
    
    init(rotorsInit:Array<Rotor>) {
        rotors = rotorsInit
    }
    
    func read() -> String {
        return String(rotors.map{$0.read()})
    }
    
    func rotate() {
        let leftState = rotors.reversed()[2].read()
        //_ = rotors.reversed().reduce(true) { if ($0) { $1.rotate(); return $1.carry} else { return false}}
        let notches = rotors.map{ $0.carry }
        for i in 0 ... rotors.count - 2 {
            if (notches[i+1]) {
                rotors[i].rotate()
            }
        }
        rotors.last!.rotate()
        
        if (leftState != rotors.reversed()[2].read()) {
            rotors.reversed()[1].rotate()
        }
    }
    
    func setOffsets(s:Array<Character>) {
        _ = zip(s, rotors).map{$1.setOffset(offset: $0)}
    }

    
    func setSettings(s:Array<Character>) {
        _ = zip(s, rotors).map{$1.setSetting(setting: $0)}
    }
    
    func readAndRotate() -> String {
        let r:String = read()
        rotate()
        return r
    }
    
    func signal(c: Character) -> (Character) {
        return rotors.reversed().reduce(c){ $1.signal(c: $0)}
    }
    
    func signalReverse(c: Character) -> (Character) {
        return rotors.reduce(c){ $1.signalReverse(c:$0)}
    }
}
