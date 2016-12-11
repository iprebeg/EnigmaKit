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
    
    var enigmaM3: Enigma!
    var enigmaM4: Enigma!
    
    override func setUp() {
        super.setUp()
        enigmaM3 = Enigma.M3()
        enigmaM4 = Enigma.M4()
    }
    
    func testExample() {
        XCTAssertEqual(enigmaM3.signal(c: "A"), "B")
        XCTAssertEqual(enigmaM3.signal(c: "A"), "D")
        XCTAssertEqual(enigmaM3.signal(c: "A"), "Z")
    }
    
    func testWhore() {
        XCTAssertEqual(enigmaM3.encrypt(s:"IAMALITTLEWHORE"),"HDKGULHRACCOPMS")
    }
    
    func testWhoreRev() {
        XCTAssertEqual(enigmaM3.encrypt(s:"HDKGULHRACCOPMS"),"IAMALITTLEWHORE")
    }
    
    func testWhoreOffset() {
        enigmaM3.setOffsets(s: "MDF")
        XCTAssertEqual(enigmaM3.encrypt(s:"IAMALITTLEWHORE"),"EVGLJDZGFMRCRUO")
    }
    
    func testWhoreRevOffset() {
        enigmaM3.setOffsets(s: "MDF")
        XCTAssertEqual(enigmaM3.encrypt(s:"EVGLJDZGFMRCRUO"),"IAMALITTLEWHORE")
    }
    
    func testWhoreSetting2() {
        enigmaM3.setSettings(s: "AAC")
        XCTAssertEqual(enigmaM3.encrypt(s:"IAMALITTLEWHORE"),"JUDDBQXRUYENLLL")
    }
    
    func testWhoreSetting2Rev() {
        enigmaM3.setSettings(s: "AAC")
        XCTAssertEqual(enigmaM3.encrypt(s:"JUDDBQXRUYENLLL"),"IAMALITTLEWHORE")
    }
    
    func testWhoreSetting() {
        enigmaM3.setSettings(s: "BCB")
        //XCTAssertEqual(enigmaM3.encrypt(s:"A"),"Z")
        XCTAssertEqual(enigmaM3.encrypt(s:"IAMALITTLEWHORE"),"GWCPUOUEDMAYQJM")
    }
    
    func testWhoreRevSetting() {
        enigmaM3.setSettings(s: "BCB")
        XCTAssertEqual(enigmaM3.encrypt(s:"GWCPUOUEDMAYQJM"),"IAMALITTLEWHORE")
    }
    
    func testBoth() {
        enigmaM3.setOffsets(s: "BDC")
        enigmaM3.setSettings(s: "CCB")
        XCTAssertEqual(enigmaM3.encrypt(s:"IAMALITTLEWHORE"),"ZJPRDOWEHMSKSNA")
    }
    
    func testBothRev() {
        enigmaM3.setOffsets(s: "BDC")
        enigmaM3.setSettings(s: "CCB")
        XCTAssertEqual(enigmaM3.encrypt(s:"ZJPRDOWEHMSKSNA"),"IAMALITTLEWHORE")
    }
    
    func testOMNOM() {
        enigmaM3.setOffsets(s: "ADU")
        let s = "UNDE"
        let r = "SOES"
        XCTAssertEqual(enigmaM3.encrypt(s:s),r)
    }
    
    func testLongTestNoSettings() {
        enigmaM3.setOffsets(s: "BDC")
        let s = "UNDERSTANDINGTHEWAYTHEMACHINEENCRYPTSREQUIRESTAKINGINTOACCOUNTTHECURRENTPOSITIONOFEACHROTORTHERINGSETTINGANDITSINTERNALWIRING"
        let r = "OBPXBCMUZXGPUFYFUMIJGJYQTCYLGHYKVQBNTYGDFWYTQCEQHMNOJWAZFAFASAETTTJGISYWHYAWOLVCTVYXWLVSHCBWXXKNWEQBIHWFRJIKBOMBLMKACNDGFMDKA"
        XCTAssertEqual(enigmaM3.encrypt(s:s),r)
        
    }
    
    func testLongTest() {
        enigmaM3.setOffsets(s: "BDC")
        enigmaM3.setSettings(s: "CCB")
        let s = "UNDERSTANDINGTHEWAYTHEMACHINEENCRYPTSREQUIRESTAKINGINTOACCOUNTTHECURRENTPOSITIONOFEACHROTORTHERINGSETTINGANDITSINTERNALWIRING"
        let r = "PQLMKMWHGPKCJLQGLCXLMDQSBJLPBHQBNEOKOOWNLBGQQOQLXZUKTYVOGPDMYOZMCVYZPNZQYMIXBKZZAHBPOBBUHDXHVMWRAALQMJQBIQBLHJMNQJZEQFKCHFJXN"
        XCTAssertEqual(enigmaM3.encrypt(s:s),r)
    }
    
    func testLongTestRev() {
        enigmaM3.setOffsets(s: "BDC")
        enigmaM3.setSettings(s: "CCB")
        let s = "PQLMKMWHGPKCJLQGLCXLMDQSBJLPBHQBNEOKOOWNLBGQQOQLXZUKTYVOGPDMYOZMCVYZPNZQYMIXBKZZAHBPOBBUHDXHVMWRAALQMJQBIQBLHJMNQJZEQFKCHFJXN"
        let r = "UNDERSTANDINGTHEWAYTHEMACHINEENCRYPTSREQUIRESTAKINGINTOACCOUNTTHECURRENTPOSITIONOFEACHROTORTHERINGSETTINGANDITSINTERNALWIRING"
        XCTAssertEqual(enigmaM3.encrypt(s:s),r)
    }
    
    func testLongTestM4() {
        enigmaM4.setOffsets(s: "DBDC")
        enigmaM4.setSettings(s: "DCCB")
        let s = "UNDERSTANDINGTHEWAYTHEMACHINEENCRYPTSREQUIRESTAKINGINTOACCOUNTTHECURRENTPOSITIONOFEACHROTORTHERINGSETTINGANDITSINTERNALWIRING"
        let r = "PQLMKMWHGPKCJLQGLCXLMDQSBJLPBHQBNEOKOOWNLBGQQOQLXZUKTYVOGPDMYOZMCVYZPNZQYMIXBKZZAHBPOBBUHDXHVMWRAALQMJQBIQBLHJMNQJZEQFKCHFJXN"
        XCTAssertEqual(enigmaM4.encrypt(s:s),r)
    }
    
    func testLongTestPlugboardM4() {
        enigmaM4.setOffsets(s: "DBDC")
        enigmaM4.setSettings(s: "DCCB")
        enigmaM4.setPlugboard(plugboard:Plugboard(plugboard:["A" : "F", "R" : "G"]))
        let s = "UNDERSTANDINGTHEWAYTHEMACHINEENCRYPTSREQUIRESTAKINGINTOACCOUNTTHECURRENTPOSITIONOFEACHROTORTHERINGSETTINGANDITSINTERNALWIRING"
        let r = "PQLMHMWYRPKCVLQRLVXLMDQRBJLPBHQBHEOKOJWNLBGQQOTLXZCKTYVHRPDMYOZMCVYITNZQYMIXBKZZFNBTOBIUHDHHVMHGFCLQMJQBYYBLHJMNQJZBQFKCHXJXX"
        XCTAssertEqual(enigmaM4.encrypt(s:s),r)
    }
    
    
}
