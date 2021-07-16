//
//  Player.swift
//  GameMonster
//
//  Created by Mason Dierkes on 6/14/21.
//

import Foundation

public struct Player: Identifiable, Codable {
    public let id: UUID
    public var name: String
}

public enum Mover: Codable {
    case local, opponent
}

/// Provides current player for ConnectFour game.
public enum ActivePlayer: CaseIterable{
    case red, yellow
    
    /// Switches the chip color to opposite value.
    /// This is used when changing player turns.
    mutating func toggle() {
        switch self {
        case .red: self = .yellow
        case .yellow: self = .red
        }
    }
}
