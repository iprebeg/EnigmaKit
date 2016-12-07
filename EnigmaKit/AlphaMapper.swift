//
//  AlphaMapper.swift
//  EnigmaKit
//
//  Created by Prebeg, Ivor on 03/12/2016.
//  Copyright © 2016 Prebeg, Ivor. All rights reserved.
//

import Foundation

class AlphaMapper {
    
    private var alphaStatic:Array<Character>
    private var alphaRot:Array<Character>
    private var length:Int
    
    init(alphaStatic:String, alphaRot:String) {
        self.alphaStatic = Array(alphaStatic.characters)
        self.alphaRot = Array(alphaRot.characters)
        if (self.alphaRot.count < self.alphaStatic.count) {
            self.alphaStatic = Array(self.alphaStatic[0...self.alphaRot.count])
        }
        self.length = self.alphaStatic.count
    }
    
    func map(c:Character, offset:Int = 0) -> (Character) {
        return alphaRot[alphaStatic.index(of: c.sub(val: offset, alphaSize: length))!].add(val: offset, alphaSize: length)
    }
    
    func maprev(c:Character, offset:Int = 0) -> (Character) {
        return alphaStatic[alphaRot.index(of: c.sub(val: offset, alphaSize: length))!].add(val: offset, alphaSize: length)
    }
    
    func read(at:Int) -> (Character) {
        return alphaStatic[at]
    }
}
