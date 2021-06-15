//
//  Messages.swift
//  GameMonster
//
//  Created by Mason Dierkes on 6/14/21.
//

import Foundation

struct MoveMessage: Codable {
    let move: Move
}

struct BoardMessage: Codable {
    let moves: [Move?]
    let audience: [Player]
}
