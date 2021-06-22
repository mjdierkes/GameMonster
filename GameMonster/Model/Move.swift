//
//  Move.swift
//  GameMonster
//
//  Created by Mason Dierkes on 6/14/21.
//

import Foundation

public protocol Move: Codable{
    var mover: Mover { get }
    var boardIndex: Int { get }
}

public struct TTTMove: Move {
    public let mover: Mover
    public let boardIndex: Int
    
    public var isWinning = false

    public var indicator: String {
        return mover == .local ? "xmark" : "circle"
    }
}


public struct MancalaMove: Move, Identifiable{
    public var id = UUID()
    
    public let mover: Mover
    public let boardIndex: Int
    
    public var stones: Int
}









