//
//  AlphaMapperTests.swift
//  EnigmaKit
//
//  Created by Prebeg, Ivor on 03/12/2016.
//  Copyright © 2016 Prebeg, Ivor. All rights reserved.
//

import Foundation

import XCTest

@testable import EnigmaKit

class AlphaMapperTests: XCTestCase {
    
    var alphaMapper: AlphaMapper!
    
    override func setUp() {
        super.setUp()
        alphaMapper = AlphaMapper(alphaStatic: "ABC", alphaRot: "BCA")
    }

    func testAlphaMapper_readMultipleTimes_thenReturnSame() {
        XCTAssertEqual(alphaMapper.map(c: "A"), "B")
        XCTAssertEqual(alphaMapper.map(c: "B"), "C")
        XCTAssertEqual(alphaMapper.map(c: "C"), "A")
    }
    
    func testAlphaMapper_readMultipleTimes_thenReturnSame2() {
        XCTAssertEqual(alphaMapper.maprev(c: "A"), "C")
        XCTAssertEqual(alphaMapper.maprev(c: "B"), "A")
        XCTAssertEqual(alphaMapper.maprev(c: "C"), "B")
    }
}
 
