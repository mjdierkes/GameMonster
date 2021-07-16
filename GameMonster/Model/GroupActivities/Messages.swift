//
//  Messages.swift
//  GameMonster
//
//  Created by Mason Dierkes on 6/14/21.
//

import Foundation

/// Messages used throughout the Group Activities framework.
/// This is how data is transferred from a single device to the whole group.

/// Sends move data for Tic Tac Toe Game
struct MoveMessage: Codable {
    let move: TTTMove
}

/// Updates other players on the status of the board.
/// Used for late joiner's to show the moves players have made beforehand. 
struct BoardMessage: Codable {
    let moves: [TTTMove?]
    let audience: [Player]
}
