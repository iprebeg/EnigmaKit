//
//  Encryptor.swift
//  EnigmaKit
//
//  Created by Prebeg, Ivor on 02/12/2016.
//  Copyright © 2016 Prebeg, Ivor. All rights reserved.
//

import Foundation

protocol Encryptor {
    func encrypt(src: String) -> (String)
    //func decrypt(src: String) -> (String)
}
