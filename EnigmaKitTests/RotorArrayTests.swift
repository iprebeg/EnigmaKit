//
//  RotorsArrayTests.swift
//  EnigmaKit
//
//  Created by Prebeg, Ivor on 02/12/2016.
//  Copyright © 2016 Prebeg, Ivor. All rights reserved.
//

import Foundation

import XCTest
@testable import EnigmaKit

class RotorArrayTests: XCTestCase {
    
    var rotorArray: RotorArray!
    
    override func setUp() {
        super.setUp()
        rotorArray = RotorArray(rotorsInit:Array(arrayLiteral:
            Rotor(rotor:"ABC", notches:Array(arrayLiteral:"C")),
            Rotor(rotor:"ABCDEF", notches:Array(arrayLiteral:"E")),
            Rotor(rotor:"ABCDEFGHI", notches:Array(arrayLiteral:"E"))
            
        ))
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testRotorArray_readMultipleTimes_thenReturnSame() {
        XCTAssertEqual(rotorArray.read(), "AAA")
        XCTAssertEqual(rotorArray.read(), "AAA")
    }
    
    func testRotor_readAndRotate_thenNextChar() {
        XCTAssertEqual(rotorArray.read(), "AAA")
        XCTAssertEqual(rotorArray.readAndRotate(), "AAA")
        XCTAssertEqual(rotorArray.readAndRotate(), "AAB")
        XCTAssertEqual(rotorArray.readAndRotate(), "AAC")
    }
    
    
    func testRotorArray_readAndRotate_overTheRotorSize_thenStartOver() {
        XCTAssertEqual(rotorArray.readAndRotate(), "AAA")
        XCTAssertEqual(rotorArray.readAndRotate(), "AAB")
        XCTAssertEqual(rotorArray.readAndRotate(), "AAC")
        
        XCTAssertEqual(rotorArray.readAndRotate(), "AAD")
        XCTAssertEqual(rotorArray.readAndRotate(), "AAE")
        XCTAssertEqual(rotorArray.readAndRotate(), "ABF")
        
        XCTAssertEqual(rotorArray.readAndRotate(), "ABG")
        XCTAssertEqual(rotorArray.readAndRotate(), "ABH")
        XCTAssertEqual(rotorArray.readAndRotate(), "ABI")
        
        XCTAssertEqual(rotorArray.readAndRotate(), "ABA")
        XCTAssertEqual(rotorArray.readAndRotate(), "ABB")
        XCTAssertEqual(rotorArray.readAndRotate(), "ABC")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
 
