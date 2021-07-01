//
//  ConnectFour.swift
//  GameMonster
//
//  Created by Mason on 6/27/21.
//

import Foundation

public enum Token {
    case red, yellow, empty
}

extension ActivePlayer {
    var cell: Token {
        switch self {
        case .red: return .red
        case .yellow: return .yellow
        }
    }
}


