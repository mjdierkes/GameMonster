//
//  Move.swift
//  GameMonster
//
//  Created by Mason Dierkes on 6/14/21.
//

import Foundation

/// Handles data for when a player adds or updates a position on the board.
public protocol Move: Codable {
    var mover: Mover { get }
    var boardIndex: Int { get }
}

/// Manages the moves for Tic Tac Toe.
public struct TTTMove: Move {
    public let mover: Mover
    public let boardIndex: Int
    
    public var isWinning = false

    public var indicator: String {
        return mover == .local ? "xmark" : "circle"
    }
}

/// Manages moves for Mancala.
public struct MancalaMove: Move, Identifiable {
    public var id = UUID()
    
    public let mover: Mover
    public let boardIndex: Int
    
    public var stones: Int
}

/// Manages moves for Connect Four.
public struct ConnectMove: Move {
    public var mover: Mover
    public var boardIndex: Int
    public var column: Int
}
