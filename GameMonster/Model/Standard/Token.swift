//
//  ConnectFour.swift
//  GameMonster
//
//  Created by Mason on 6/27/21.
//

import Foundation

/// Keeps track of the status a chip in a Connect Four game
public enum Token {
    case red, yellow, empty
}

/// Switches the chip status to a color based value for easy use.
/// Used when displaying a chip.
extension ActivePlayer {
    var cell: Token {
        switch self {
        case .red: return .red
        case .yellow: return .yellow
        }
    }
}
