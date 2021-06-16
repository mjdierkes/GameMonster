//
//  GameBoard.swift
//  GameMonster
//
//  Created by Mason Dierkes on 6/14/21.
//

import Foundation

public protocol GameBoard: ObservableObject {
    
    var name: String { get }
    
    var isDisabled: Bool { get set }
    var moves: [Move?] { get set }
    
    var audience: [Player] { get set }
    var opponent: Player { get set }
    
    
    func reset()
    
    func update(for move: Move)

    func removeGame()
    
    
}

//public class GameBoardRequestType: GameBoard {
//    
//}

public enum GameStatus {
    case local, opponent, draw, undetermined
}
