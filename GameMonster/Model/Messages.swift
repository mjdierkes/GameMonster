//
//  Messages.swift
//  GameMonster
//
//  Created by Mason Dierkes on 6/14/21.
//

import Foundation

struct MoveMessage: Codable {
    let move: TTTMove
}

struct BoardMessage: Codable {
    let moves: [TTTMove?]
    let audience: [Player]
}
