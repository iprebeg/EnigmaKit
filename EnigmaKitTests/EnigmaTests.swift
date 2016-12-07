//
//  EnigmaTests.swift
//  EnigmaKit
//
//  Created by Prebeg, Ivor on 02/12/2016.
//  Copyright © 2016 Prebeg, Ivor. All rights reserved.
//

import Foundation

import XCTest
@testable import EnigmaKit

class EnigmaKitTests: XCTestCase {
    
    var enigma: Enigma!
    
    override func setUp() {
        super.setUp()
        enigma = Enigma.M3()
    }
    
    func testExample() {
        XCTAssertEqual(enigma.signal(c: "A"), "B")
        XCTAssertEqual(enigma.signal(c: "A"), "D")
        XCTAssertEqual(enigma.signal(c: "A"), "Z")
    }
    
    func testWhore() {
        XCTAssertEqual(enigma.encrypt(s:"IAMALITTLEWHORE"),"HDKGULHRACCOPMS")
    }
    
    func testWhoreRev() {
        XCTAssertEqual(enigma.encrypt(s:"HDKGULHRACCOPMS"),"IAMALITTLEWHORE")
    }
    
    func testWhoreOffset() {
        enigma.setOffsets(s: "MDF")
        XCTAssertEqual(enigma.encrypt(s:"IAMALITTLEWHORE"),"EVGLJDZGFMRCRUO")
    }
    
    func testWhoreRevOffset() {
        enigma.setOffsets(s: "MDF")
        XCTAssertEqual(enigma.encrypt(s:"EVGLJDZGFMRCRUO"),"IAMALITTLEWHORE")
    }
    
    func testWhoreSetting2() {
        enigma.setSettings(s: "AAC")
        XCTAssertEqual(enigma.encrypt(s:"IAMALITTLEWHORE"),"JUDDBQXRUYENLLL")
    }
    
    func testWhoreSetting2Rev() {
        enigma.setSettings(s: "AAC")
        XCTAssertEqual(enigma.encrypt(s:"JUDDBQXRUYENLLL"),"IAMALITTLEWHORE")
    }
    
    func testWhoreSetting() {
        enigma.setSettings(s: "BCB")
        //XCTAssertEqual(enigma.encrypt(s:"A"),"Z")
        XCTAssertEqual(enigma.encrypt(s:"IAMALITTLEWHORE"),"GWCPUOUEDMAYQJM")
    }
    
    func testWhoreRevSetting() {
        enigma.setSettings(s: "BCB")
        XCTAssertEqual(enigma.encrypt(s:"GWCPUOUEDMAYQJM"),"IAMALITTLEWHORE")
    }
    
    func testBoth() {
        enigma.setOffsets(s: "BDC")
        enigma.setSettings(s: "CCB")
        XCTAssertEqual(enigma.encrypt(s:"IAMALITTLEWHORE"),"ZJPRDOWEHMSKSNA")
    }
    
    func testBothRev() {
        enigma.setOffsets(s: "BDC")
        enigma.setSettings(s: "CCB")
        XCTAssertEqual(enigma.encrypt(s:"ZJPRDOWEHMSKSNA"),"IAMALITTLEWHORE")
    }
    
    func testOMNOM() {
        enigma.setOffsets(s: "ADU")
        let s = "UNDE"
        let r = "SOES"
        XCTAssertEqual(enigma.encrypt(s:s),r)
    }
    
    func testLongTestNoSettings() {
        enigma.setOffsets(s: "BDC")
        let s = "UNDERSTANDINGTHEWAYTHEMACHINEENCRYPTSREQUIRESTAKINGINTOACCOUNTTHECURRENTPOSITIONOFEACHROTORTHERINGSETTINGANDITSINTERNALWIRING"
        let r = "OBPXBCMUZXGPUFYFUMIJGJYQTCYLGHYKVQBNTYGDFWYTQCEQHMNOJWAZFAFASAETTTJGISYWHYAWOLVCTVYXWLVSHCBWXXKNWEQBIHWFRJIKBOMBLMKACNDGFMDKA"
        XCTAssertEqual(enigma.encrypt(s:s),r)
        
    }
    
    func testLongTest() {
        enigma.setOffsets(s: "BDC")
        enigma.setSettings(s: "CCB")
        let s = "UNDERSTANDINGTHEWAYTHEMACHINEENCRYPTSREQUIRESTAKINGINTOACCOUNTTHECURRENTPOSITIONOFEACHROTORTHERINGSETTINGANDITSINTERNALWIRING"
        let r = "PQLMKMWHGPKCJLQGLCXLMDQSBJLPBHQBNEOKOOWNLBGQQOQLXZUKTYVOGPDMYOZMCVYZPNZQYMIXBKZZAHBPOBBUHDXHVMWRAALQMJQBIQBLHJMNQJZEQFKCHFJXN"
        XCTAssertEqual(enigma.encrypt(s:s),r)
        
    }
}
