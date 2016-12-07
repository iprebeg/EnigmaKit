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
    
    var rotor: Rotor!
    
    override func setUp() {
        super.setUp()
        rotor = Rotor(rotor:"ABCD", offset:"A", notches:Array(arrayLiteral: "A"))
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
        XCTAssertEqual(rotor.read(), "A")
        rotor.rotate()
        XCTAssertEqual(rotor.read(), "B")
        rotor.rotate()
        XCTAssertEqual(rotor.read(), "C")
        XCTAssertFalse(rotor.carry)
    }
    
    func testRotor_readAndRotate_overTheRotorSize_thenStartOver() {
        XCTAssertEqual(rotor.read(), "A")
        rotor.rotate()
        XCTAssertEqual(rotor.read(), "B")
        rotor.rotate()
        XCTAssertEqual(rotor.read(), "C")
        rotor.rotate()
        XCTAssertEqual(rotor.read(), "D")
        rotor.rotate()
        XCTAssertTrue(rotor.carry)
        XCTAssertEqual(rotor.read(), "A")
        rotor.rotate()
        XCTAssertFalse(rotor.carry)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
 
