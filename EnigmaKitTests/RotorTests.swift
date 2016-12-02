//
//  RotorTests.swift
//  EnigmaKit
//
//  Created by Prebeg, Ivor on 02/12/2016.
//  Copyright © 2016 Prebeg, Ivor. All rights reserved.
//

import Foundation

import XCTest

@testable import EnigmaKit

class RotorTests: XCTestCase {
    
    var rotor: Rotor = Rotor(rotorInit:"NONE")
    
    override func setUp() {
        super.setUp()
        rotor = Rotor(rotorInit:"ABCD")
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testRotor_readMultipleTimes_thenReturnSame() {
        XCTAssertEqual(rotor.read(), "A")
        XCTAssertEqual(rotor.read(), "A")
        XCTAssertFalse(rotor.carry)
    }
    
    func testRotor_readAndRotate_thenNextChar() {
        XCTAssertEqual(rotor.read(), "A")
        XCTAssertEqual(rotor.readAndRotate(), "A")
        XCTAssertEqual(rotor.readAndRotate(), "B")
        XCTAssertEqual(rotor.readAndRotate(), "C")
        XCTAssertFalse(rotor.carry)
    }
    
    func testRotor_readAndRotate_overTheRotorSize_thenStartOver() {
        XCTAssertEqual(rotor.readAndRotate(), "A")
        XCTAssertEqual(rotor.readAndRotate(), "B")
        XCTAssertEqual(rotor.readAndRotate(), "C")
        XCTAssertEqual(rotor.readAndRotate(), "D")
        XCTAssertTrue(rotor.carry)
        XCTAssertEqual(rotor.readAndRotate(), "A")
        XCTAssertFalse(rotor.carry)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
 
