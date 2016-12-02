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
    
    var rotorArray: RotorArray = RotorArray(rotorsInit:Array())
    
    override func setUp() {
        super.setUp()
        rotorArray = RotorArray(rotorsInit:Array(arrayLiteral:
            Rotor(rotorInit:"ABC"),
            Rotor(rotorInit:"DEF"),
            Rotor(rotorInit:"GHI")
            
        ))
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testRotorArray_readMultipleTimes_thenReturnSame() {
        XCTAssertEqual(rotorArray.read(), "ADG")
        XCTAssertEqual(rotorArray.read(), "ADG")
    }
    
    func testRotor_readAndRotate_thenNextChar() {
        XCTAssertEqual(rotorArray.read(), "ADG")
        XCTAssertEqual(rotorArray.readAndRotate(), "ADG")
        XCTAssertEqual(rotorArray.readAndRotate(), "ADH")
        XCTAssertEqual(rotorArray.readAndRotate(), "ADI")
    }
    
    
    func testRotorArray_readAndRotate_overTheRotorSize_thenStartOver() {
        XCTAssertEqual(rotorArray.readAndRotate(), "ADG")
        XCTAssertEqual(rotorArray.readAndRotate(), "ADH")
        XCTAssertEqual(rotorArray.readAndRotate(), "ADI")
        
        XCTAssertEqual(rotorArray.readAndRotate(), "AEG")
        XCTAssertEqual(rotorArray.readAndRotate(), "AEH")
        XCTAssertEqual(rotorArray.readAndRotate(), "AEI")
        
        XCTAssertEqual(rotorArray.readAndRotate(), "AFG")
        XCTAssertEqual(rotorArray.readAndRotate(), "AFH")
        XCTAssertEqual(rotorArray.readAndRotate(), "AFI")
        
        XCTAssertEqual(rotorArray.readAndRotate(), "BDG")
        XCTAssertEqual(rotorArray.readAndRotate(), "BDH")
        XCTAssertEqual(rotorArray.readAndRotate(), "BDI")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
 
