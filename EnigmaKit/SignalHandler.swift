//
//  Substitutor.swift
//  EnigmaKit
//
//  Created by Prebeg, Ivor on 02/12/2016.
//  Copyright © 2016 Prebeg, Ivor. All rights reserved.
//

import Foundation

protocol SignalHandler {
    func signal (c:Character) -> (Character)
}

protocol ReversibleSignalHandler : SignalHandler {
    func signalReverse(c:Character) -> (Character)
}
