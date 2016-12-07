//
//  ReflectorTests.swift
//  EnigmaKit
//
//  Created by Prebeg, Ivor on 04/12/2016.
//  Copyright © 2016 Prebeg, Ivor. All rights reserved.
//

import Foundation

import XCTest
@testable import EnigmaKit

class ReflectorTests: XCTestCase {
    
    var reflector:Reflector!
    
    override func setUp() {
        super.setUp()
        reflector = Reflector(reflector:"CBAD")
    }

    
    func testReflector() {
        XCTAssertEqual(reflector.signal(c: "A"), "C")
        XCTAssertEqual(reflector.signal(c: "B"), "B")
        XCTAssertEqual(reflector.signal(c: "C"), "A")
        XCTAssertEqual(reflector.signal(c: "D"), "D")

    }
}
