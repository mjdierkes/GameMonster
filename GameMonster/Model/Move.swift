//
//  Move.swift
//  GameMonster
//
//  Created by Mason Dierkes on 6/14/21.
//

import Foundation

public struct Move: Codable {
    let mover: Mover
    let boardIndex: Int
    
    var isWinning = false
    
    var indicator: String {
        return mover == .local ? "xmark" : "circle"
    }
}

